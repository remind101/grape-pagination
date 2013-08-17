require 'grape'

require 'grape/pagination/version'

module Grape
  module Pagination
    autoload :Configuration, 'grape/pagination/configuration'
    autoload :Extensions,    'grape/pagination/extensions'
    autoload :Helpers,       'grape/pagination/helpers'
    autoload :Paginator,     'grape/pagination/paginator'
    autoload :LinkHeader,    'grape/pagination/link_header'

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield configuration
    end

    Grape::API.send :extend, Grape::Pagination::Extensions
    Grape::Endpoint.send :include, Grape::Pagination::Helpers
  end
end
