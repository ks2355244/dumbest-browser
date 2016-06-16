class Page
  def initialize(url)
    @url = url
    @html = ""
  end
  
  def fetch!
    parsed_url = URI.parse(@url)
    response = Net::HTTP.get(parsed_url)
    @html = Nokogiri::HTML(response)
  end
  
  def title
    @html.at_css('title').text
  end
  
  def links
    links = @html.css('a')
    links.map { |link| link[:href] }
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    #
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
  end
end