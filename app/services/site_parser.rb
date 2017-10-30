require 'open-uri'
require 'active_support/core_ext/hash'
class SiteParser
  include ActiveModel::Validations
  attr_accessor :url
  validates :url, presence: true
  validate :check_url
  def initialize(url)
    @url = url
    @content = ""
    @header_tags = %w(h1 h2 h3)
    @doc = ""
  end

  def exec
    if valid?
      @header_tags.each do |header_tag|
        @doc.xpath("//#{header_tag}").each do |header|
          @content << header.children.text + "\n" if header.children
        end
      end

      @doc.xpath("//a").each do |a|
        @content << a.attributes["href"].value + "\n" if a.attributes["href"]
      end

      @content
    else
      false
    end
  end

  def check_url
    begin
      @doc = Nokogiri::HTML(Kernel.open(@url))
    rescue Exception => e
      errors.add(:url, e)
    end
  end
end
