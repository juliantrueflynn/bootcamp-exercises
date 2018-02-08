require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    "#{class_name.downcase}s"
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      foreign_key: "#{name.singularize.underscore}_id".to_sym,
      primary_key: :id,
      class_name: "#{name.camelcase}"
    }
    options = defaults.merge(options)

    options.each do |attr_key, attr_val|
      self.class.define_method(attr_key) do
        attr_val
      end

      self.class.define_method("#{attr_key}=") do
        self.class.attr_key = attr_val
      end
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      foreign_key: "#{self_class_name.singularize.underscore}_id".to_sym,
      primary_key: :id,
      class_name: name.to_s.singularize.camelcase
    }
    options = defaults.merge(options)

    options.each do |attr_key, attr_val|
      self.class.define_method(attr_key) do
        attr_val
      end

      self.class.define_method("#{attr_key}=") do
        self.class.attr_key = attr_val
      end
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    debugger
    attr = BelongsToOptions.new(name, options)
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
