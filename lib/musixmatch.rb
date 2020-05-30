# frozen_string_literal: true

require 'musixmatch/version'
require 'musixmatch/request'
require 'musixmatch/api_method'

class Musixmatch
  include Version
  include Request
  include APIMethod
  attr_accessor :api_key, :url, :version, :api_version

  def initialize(api_key = ENV['MUSIXMATCH_API_KEY'])
    raise 'API key is required' unless api_key

    @version = Version.version
    @api_version = Version.api_version
    @api_key = api_key
    @url = Request.base_url
  end
end
