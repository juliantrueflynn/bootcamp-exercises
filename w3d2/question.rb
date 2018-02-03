require_relative 'database'
require_relative 'user'
require_relative 'reply'
require_relative 'question_follow'

class Question
  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM questions')
    results.map { |result| Question.new(result) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    data.map { |obj| Question.new(obj) }
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

    data.map { |obj| Question.new(obj) }
  end

  def self.most_followed(limit)
    QuestionFollow.most_followed_questions(limit)
  end

  attr_accessor :id, :title, :body, :author_id

  def initialize(options = {})
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']    
  end

  def author
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    data.map { |obj| User.new(obj) }
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def followers
    QuestionFollow.followers_for_question_id(id)
  end

  def likers
    QuestionLike.likers_for_question_id(id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(id)
  end
end