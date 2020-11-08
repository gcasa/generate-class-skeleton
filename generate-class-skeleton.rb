require 'net/http'
require 'uri'

# Create class based on web page information.
class ClassGenerator
  def initialize(framework, classname)
    @framework = framework
    @classname = classname
  end

  def wget(url)
    resp = nil
    url = URI.parse(url)
    Net::HTTP.start(url.host) do |http|
      resp = http.get(url.path)
    end
    resp.body
  end

  def create_url_for_class
    cname = @classname.downcase
    fname = @framework.downcase
    url = "https://developer.apple.com/documentation/#{fname}/#{cname}?language=objc"
    puts url
    body = wget(url)
    puts body
  end

  def generate
    data = create_url_for_class
    puts data
  end
end

framework = 'Foundation'
classname = 'NSDictionary'

generator = ClassGenerator.new(framework, classname)
generator.generate

