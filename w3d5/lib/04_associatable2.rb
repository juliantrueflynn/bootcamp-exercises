require_relative '03_associatable'

# Phase IV
module Associatable
  def has_one_through(name, through_name, source_name)
    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]
      
      source_table = source_options.table_name
      source_primary_key = source_options.primary_key
      source_foreign_key = source_options.foreign_key

      through_table = through_options.table_name
      through_primary_key = through_options.primary_key

      key_val = self.send(through_options.foreign_key)

      data = DBConnection.execute(<<-SQL, key_val)
        SELECT
          #{source_table}.*
        FROM
          #{through_table}
        JOIN
          #{source_table}
        ON
          #{through_table}.#{source_foreign_key} = #{source_table}.#{through_primary_key}
        WHERE
          #{source_table}.#{through_primary_key} = ?
      SQL

      source_options.model_class.parse_all(data).first
    end
  end
end
