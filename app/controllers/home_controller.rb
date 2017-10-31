# frozen_string_literal: true

class HomeController < ActionController::Base
  protect_from_forgery with: :exception
  def sample; end
end
