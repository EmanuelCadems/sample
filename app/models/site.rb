# frozen_string_literal: true

class Site < ApplicationRecord
  validate :check_url

  private

  def check_url
    sp = SiteParser.new(url)
    self.content = if (result = sp.exec)
                     result
                   else
                     errors.add(:url, sp.errors.full_messages)
                     false
                   end
  end
end
