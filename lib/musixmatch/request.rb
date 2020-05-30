# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module Request
  def base_url(url = 'https://api.musixmatch.com')
    url
  end

  def http
    Faraday.new(url: base_url) do |f|
      f.response :mashify
      f.response :json
      f.request :url_encoded
      f.request :retry, max: 5, interval: 1.0
      f.options[:open_timeout] = 2
      f.options[:timeout] = 5
      f.headers['Accept'] = 'application/json'
      f.headers['User-Agent'] = "ruby-musixmatch/#{version}"
      f.adapter :net_http
    end
  end

  module_function :base_url
end
