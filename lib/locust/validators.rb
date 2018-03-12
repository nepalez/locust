class Locust
  #
  # @private
  # Namespace for schema validators
  #
  module Validators
    require_relative "validators/base"
    require_relative "validators/const"
    require_relative "validators/enum"
    require_relative "validators/format"
    require_relative "validators/items"
    require_relative "validators/pattern"
    require_relative "validators/properties"
    require_relative "validators/required"
    require_relative "validators/type"
    require_relative "validators/xml"
  end
end
