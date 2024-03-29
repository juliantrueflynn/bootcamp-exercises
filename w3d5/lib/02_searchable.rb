require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    where_line = params.map { |key, _| "#{key} = ?"}.join(" AND ")

    data = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL

    data.map { |datum| self.new(datum) }
  end
end

class SQLObject
  self.extend(Searchable)
end
