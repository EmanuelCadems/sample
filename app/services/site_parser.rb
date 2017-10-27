require 'open-uri'
class SiteParser
  def initialize(url)
    @url = url
    @content = ""
    @header_tags = %w(h1 h2 h3)
  end

  def exec
    doc = Nokogiri::HTML(open(@url))

    @header_tags.each do |header_tag|
      doc.xpath("//#{header_tag}").each do |header|
        @content << header.children.text + "\n"
      end
    end

    doc.xpath("//a").each do |a|
      @content << a.attributes["href"].value + "\n"
    end

    @content
  end
end
