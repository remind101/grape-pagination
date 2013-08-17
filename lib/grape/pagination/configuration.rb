module Grape::Pagination
  class Configuration
    attr_reader :total_proc

    def total_proc
      @total_proc ||= lambda { |collection| collection.count }
    end
  end
end
