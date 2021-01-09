require 'json'
require 'cgi'
require 'net/http'

class Quizi::Game < Quizi::Model 
  AMMOUNT = 10

  def get_categories 
    Quizi::Category.from_opentdb
  end
  
  def initialize(args)
    puts args
  end

  def start
    puts "Please tell us your name:"
    @name = gets.chomp
    @name.capitalize!

    puts "Welcome #{@name.capitalize}!\n"

    select_category()

    ask

  end

  def select_category()
    puts "Select your Category"

    categories
    category = gets.chomp 

    category = category.to_i

    if category == 0 || category > CATEGORIES.size + 1
      puts "You didn't enter a vaild number"
      select_category()
    end

    @category = CATEGORIES[category - 1]
  end

  def ask 
    questions = JSON.parse(get_questions)

    questions["results"].each do |question|
      puts question["question"]
    end

    # @questions.each do |question|
    #   puts question.text
    # end
  end
end