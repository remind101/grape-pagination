require 'addressable/uri'

module Grape::Pagination
  class LinkHeader
    attr_reader :url
    attr_reader :page_params

    def initialize(url, page_params)
      @url         = url
      @page_params = page_params
    end

    def next
      Link.new(url, 'next', page_params.merge(page: page_params[:page] + 1))
    end

    def to_rfc5988
      %w[next].map { |link| __send__(link).to_s }.join(', ')
    end

  private

    class Link
      attr_reader :url, :rel, :page_params

      def initialize(url, rel, page_params)
        @url, @rel, @page_params = url, rel, page_params
      end

      def to_s
        %(<#{uri.to_s}>; rel="#{rel}")
      end

    private

      def uri
        @uri ||= begin
          uri = Addressable::URI.parse(url)
          uri.query_values = (uri.query_values || {}).merge(page_params.stringify_keys)
          uri
        end
      end

    end

  end
end
