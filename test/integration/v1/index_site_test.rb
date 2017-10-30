#encoding=utf-8
require 'test_helper'
module V1
  class IndexSiteTest < ActionDispatch::IntegrationTest
    # This is a stup for open(url). You can comment this and start the server for using real url
    require 'open-uri'
    Kernel.class_eval do
      def self.open(url)
        # Nokogiri::HTML("<html lang='en'><head><title>Emanuel Alarcón</title></head><body><h1>Emanuel Alarcón</h1><h2>Backend Developer Ruby on Rails</h2><h3>System Engineer</h3><a href='https://www.linkedin.com/in/emanuel-alarcon'>Linkedin</a><a href='https://github.com/EmanuelCadems'>Github</a></body></html>".html_safe)
        case url
        when 'http://localhost:3000/sample'
          "<html lang='en'><head><title>Emanuel Alarcón</title></head><body><h1>Emanuel Alarcón</h1><h2>Backend Developer Ruby on Rails</h2><h3>System Engineer</h3><a href='https://www.linkedin.com/in/emanuel-alarcon'>Linkedin</a><a href='https://github.com/EmanuelCadems'>Github</a></body></html>".html_safe
        when 'http://localhost:3000/wrong'
          raise 'Not found'
        else
          raise 'Error'
        end
      end
    end

    test "index content inside a valid url" do
      post '/v1/sites',
      params: {
        site: {
          url: 'http://localhost:3000/sample'
        }
      }
      assert_equal 201, response.status
      assert_equal Mime::Type.lookup('application/json'), response.content_type
      site = json(response.body)
      assert_equal v1_site_url(site['id']), response.location
      assert_equal 'http://localhost:3000/sample', site['url']
      assert_equal "Emanuel Alarcón\nBackend Developer Ruby on Rails\nSystem Engineer\nhttps://www.linkedin.com/in/emanuel-alarcon\nhttps://github.com/EmanuelCadems\n", site['content']
    end

    test "does not index invalid url" do
      post '/v1/sites',
      params: {
        site: {
          url: 'http://localhost:3000/wrong'
        }
      }

      assert_equal 422, response.status
    end
  end
end
