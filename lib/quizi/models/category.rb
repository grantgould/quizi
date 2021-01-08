class Quizi::Category < Quizi::Model
  attr_accessor :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.from_opentdb
    categories = []

    api = Quizi::API.new("api_category.php", options: {})

    json = api.get_data()

    json["trivia_categories"].each do |category|
      categories << self.new(id: category["id"], name: category["name"])
    end

    categories
  end
end