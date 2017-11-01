# frozen_string_literal: true

require 'test_helper'
module V1
  class IndexSiteTest < ActionDispatch::IntegrationTest
    # This is a stup for open(url). You can comment this and start the server
    # for using real url
    require 'open-uri'
    Kernel.class_eval do
      def self.open(url)
        case url
        when 'http://localhost:3000/sample'
          html_doc
        when 'http://localhost:3000/wrong'
          raise 'Not found'
        else
          raise 'Error'
        end
      end

      # rubocop:disable MethodLength
      def html_doc
        "<html lang='en'>
<head>
  <title>Emanuel Alarcón</title>
</head>
<body>
  <h1>Emanuel Alarcón</h1>
  <h2>Backend Developer Ruby on Rails</h2>
  <h3>System Engineer</h3>
  <a href='https://www.linkedin.com/in/emanuel-alarcon'>Linkedin</a>
  <a href='https://github.com/EmanuelCadems'>Github</a>
</body></html>
".html_safe
      end
    end

    test 'index content inside a valid url' do
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
      assert_equal "Emanuel Alarcón
Backend Developer Ruby on Rails
System Engineer
https://www.linkedin.com/in/emanuel-alarcon
https://github.com/EmanuelCadems\n", site['content']
    end

    test 'does not index invalid url' do
      post '/v1/sites',
           params: {
             site: {
               url: 'http://localhost:3000/wrong'
             }
           }

      assert_equal 422, response.status
    end

    test 'does not index a website without a url' do
      post '/v1/sites',
           params: {
             site: {
               url: ''
             }
           }

      assert_equal 422, response.status
      assert_includes json(response.body)['errors'], 'Url can\'t be blank'
    end
  end
end
