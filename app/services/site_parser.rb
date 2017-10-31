require 'open-uri'
require 'active_support/core_ext/hash'

# This services allows you to parse a remote url extracting content inside links
# h1, h2, and h3 tags
# SiteParser.new('http://www.google.com').exec
class SiteParser
  include ActiveModel::Validations
  attr_accessor :url
  validates :url, presence: true
  validate :check_url

  def initialize(url)
    @url = url
    @content = ''
    @doc = ''
  end

  def exec
    return unless valid?
    find_header_tags

    find_links

    @content
  end

  private

  def header_tags
    %w[h1 h2 h3]
  end

  def check_url
    @doc = Nokogiri::HTML(Kernel.open(@url))
  rescue StandardError => e
    errors.add(:url, e)
  end

  def find_header_tags
    header_tags.each do |header_tag|
      @doc.xpath("//#{header_tag}").each do |header|
        @content << header.children.text + "\n" if header.children
      end
    end
  end

  def find_links
    @doc.xpath('//a').each do |a|
      @content << a.attributes['href'].value + "\n" if a.attributes['href']
    end
  end
end
