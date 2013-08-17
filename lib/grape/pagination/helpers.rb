module Grape::Pagination
  module Helpers
    def paginate(*args)
      Grape::Pagination::Paginator.paginate(self, *args)
    end
  end
end
