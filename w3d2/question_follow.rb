require_relative 'database'
require_relative 'question'
require_relative 'user'

class QuestionFollow
  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
    results.map { |result| QuestionFollow.new(result) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    data.map { |obj| QuestionFollow.new(obj) }
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON question_follows.author_id = users.id
      WHERE
        question_id = ?
    SQL

    data.map { |obj| User.new(obj) }    
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions ON question_follows.question_id = questions.id
      WHERE
        question_follows.author_id = ?
    SQL

    data.map { |obj| Question.new(obj) }
  end

  def self.most_followed_questions(limit)
    data = QuestionsDatabase.instance.execute(<<-SQL, limit)
      SELECT
        *, COUNT(question_follows.question_id) as follow_amount
      FROM
        question_follows
      JOIN
        questions ON question_follows.question_id = questions.id
      GROUP BY
        question_follows.question_id
      ORDER BY
        follow_amount DESC
      LIMIT
        ?
    SQL

    data.map { |obj| Question.new(obj) }
  end

  attr_accessor :id, :question_id, :author_id

  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id'] 
    @author_id = options['author_id']    
  end
end