module Grape::Pagination
  module Validations
    def validate_param!(attr_name, params)
      if attr_name == "page"
        unless (params[attr_name].is_a?(Integer) && params[attr_name] > 0)
          raise Grape::Exceptions::Validation, param: @scope.full_name(attr_name), message: "page must be an integer above 0"
        end
      end
    end
  end
end