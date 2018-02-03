require_relative 'database'
require_relative 'question'
require_relative 'user'

class QuestionLike
  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
    results.map { |result| QuestionLike.new(result) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    data.map { |obj| QuestionLike.new(obj) }
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_likes likes
      JOIN
        users ON likes.author_id = users.id
      WHERE
        likes.question_id = ?
    SQL

    data.map { |obj| User.new(obj) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(author_id) as like_count
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL

    data.first['like_count']
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_likes likes
      JOIN
        questions ON likes.question_id = questions.id
      WHERE
        likes.author_id = ?
    SQL

    data.map { |obj| Question.new(obj) }
  end
  
  def self.most_liked_questions(limit)
    data = QuestionsDatabase.instance.execute(<<-SQL, limit)
      SELECT
        *, COUNT(likes.author_id) AS like_count
      FROM
        question_likes likes
      JOIN
        questions ON likes.question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        like_count DESC
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