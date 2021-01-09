require "rest-client"

class Quizi::API < Quizi::Model
  attr_accessor :url 

  SERVICE = "https://opentdb.com"

  def initialize(resource, options:)
    @resource = resource
    @options = options
  end

  def get_data()
    response = RestClient.get(uri)
    JSON.parse(response)
  rescue e
    puts "Please reconnect to the internet."
  end

  def uri
    "#{SERVICE}/#{@resource}?#{to_query}"
  end

  def to_query
    URI.encode_www_form(@options)
  end

end