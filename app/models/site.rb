class Site < ApplicationRecord
  before_save :set_content


  private

  def set_content
    self.content = SiteParser.new(url).exec
  end
end
