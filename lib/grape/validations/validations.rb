module Grape::Validations
  class PaginationPageValidator < Validator
    def validate_param!(attr_name, params)
      unless params[attr_name].to_i >= 1
        throw :error, :status => 400, :message => "The page param must have a value of 1 or greater."
      end
    end
  end
end