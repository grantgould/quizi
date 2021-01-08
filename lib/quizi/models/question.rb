class Quizi::Question < Quizi::Model
  attr_accessor :question, :correct_answer, :incorrect_answers

  def initialize(question, correct_answer:, incorrect_answers:)
    @question = question 
    @correct_answer = correct_answer
    @incorrect_answers = incorrect_answers
    @answers = [incorrect_answers + [correct_answer]].flatten.shuffle
  end

  def answers
    @answers
  end

  def guess(number)
    @answers[number] == @correct_answer
  end

  def self.from_opentdb(category = 9)
    questions = []

    api = Quizi::API.new("api.php", options: {amount: 10, category: 9})

    json = api.get_data()

    json["results"].each do |question|
      questions << self.new(
        question["question"], 
        correct_answer: question["correct_answer"],
        incorrect_answers: question["incorrect_answers"]
      )
    end

    questions
  end
end

categories = Category.from_opentdb

Category.from_opentdb(category[0].id)