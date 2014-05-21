module Grape::Pagination
  module Extensions
    def paginate(options = {})
      defaults = {
        page: {
          type: Integer,
          desc: 'Page offset to fetch.'
        },
        per_page: {
          type: Integer,
          desc: 'Number of results to return per page.',
          default: 30
        }
      }

      options.reverse_merge!(defaults)
      options[:page].reverse_merge!(pagination_page: true, default: 1) if options[:page][:type] == Integer

      params do
        optional :page, options[:page]
        optional :per_page, options[:per_page]
      end
    end
  end
end


