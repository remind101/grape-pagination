require 'addressable/uri'

module Grape::Pagination
  class Link
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def next
      uri.dup.tap { |uri| uri.query_values = uri.query_values.merge('page' => uri.query_values['page'].to_i + 1) }
    end

    def to_rfc5988
      %w[next].map { |link| [__send__(link), link] }
        .compact
        .map { |(link, rel)| %(<#{link}>; rel="#{rel}") }
        .join(', ')
    end

  private

    def uri
      @uri ||= Addressable::URI.parse(url)
    end

  end
end
