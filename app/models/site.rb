# frozen_string_literal: true

class Site < ApplicationRecord
  validate :check_url

  private

  def check_url
    sp = SiteParser.new(url)
    self.content = if (result = sp.exec)
                     result
                   else
                     cp_errors(sp.errors)

                     false
                   end
  end

  def cp_errors(source)
    source.messages.each do |key, value|
      value.each do |msg|
        errors.add(key, msg)
      end
    end
  end
end
