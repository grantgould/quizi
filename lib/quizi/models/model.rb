class Quizi::Model 
  def self.from_opentdb(resource:, options:, klass:)
    instances = []

    api = Quizi::API.new(resource, options: options)

    json = api.get_data()

    json["results"].each do |instance|
      instances << klass.new(
        question
      )
    end

    instances
  end
end