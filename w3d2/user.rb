require_relative 'database'
require_relative 'reply'
require_relative 'question'
require_relative 'question_like'
require_relative 'question_follow'

class User
  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM users')
    results.map { |result| User.new(result) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    data.map { |obj| User.new(obj) }
  end

  def self.find_by_name(fname, lname)
    user_name = {first_name: fname, last_name: lname}
    
    data = QuestionsDatabase.instance.execute(<<-SQL, user_name)
      SELECT
        *
      FROM
        users
      WHERE
        fname = :first_name AND lname = :last_name
    SQL

    data.map { |obj| User.new(obj) }
  end

  attr_accessor :id, :fname, :lname

  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(id)
  end

  def average_karma
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        (CAST(COUNT(likes.question_id) AS FLOAT) / COUNT(DISTINCT(likes.question_id))) AS karma
      FROM
        users u
      LEFT OUTER JOIN
        questions q ON u.id = q.author_id
      LEFT OUTER JOIN
        question_likes likes ON q.id = likes.question_id
      WHERE
        q.author_id = id
    SQL

    data.first['karma']
  end

  def save
    if id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO
          users (fname, lname)
        VALUES
          (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE
          users
        SET
          fname = ?, lname = ?
        WHERE
          id = ?
      SQL
    end
  end
end