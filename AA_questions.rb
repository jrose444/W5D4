require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('.db')
    self.type_translation = true
    self.results_as_hash = true

end



class Question_likes
  def self.find_by_id
  question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        Question_likes
      WHERE
        id = ?
    SQL
    return nil unless question_like.length > 0

    Question_likes.new(question_like.first)
end

class Reply
  def self.find_by_id
  reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
end

class Question_follow
  def self.find_by_id
  question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        Question_follows
      WHERE
        id = ?
    SQL
    return nil unless question_follows.length > 0

    Question_follow.new(question_follows.first)
end

class Question
    def self.find_by_id
  question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        Questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
end

class User

  def self.find_by_id
  user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless users.length > 0

    User.new(user.first)
  end

def find_by_name(fname, lname)
user = PlayDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?
        OR
        lname = ?
    SQL
    return nil unless users.length > 0

    User.new(user.first)
end


end