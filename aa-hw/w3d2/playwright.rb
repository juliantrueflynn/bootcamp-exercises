require_relative 'db'
require_relative 'play'

class Playwright
  def self.all
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        playwrights
    SQL

    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL, name: name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = :name
    SQL

    data.map { |datum| Playwright.new(datum) }
  end

  attr_accessor :id, :name, :birth_year

  def initialize(options = {})
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "ID already in database" if id
    
    PlayDBConnection.instance.execute(<<-SQL, name, birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL

    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "ID not in database, add first" unless id

    PlayDBConnection.instance.execute(<<-SQL, name, birth_year, id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    Play.find_by_playwright(name)
  end
end