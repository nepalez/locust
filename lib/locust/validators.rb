class Locust
  #
  # @private
  # Namespace for schema validators
  #
  module Validators
    require_relative "validators/base"
    require_relative "validators/base_number"
    require_relative "validators/base_positive"

    require_relative "validators/const"
    require_relative "validators/enum"
    require_relative "validators/exclusive_maximum"
    require_relative "validators/exclusive_minimum"
    require_relative "validators/format"
    require_relative "validators/item"
    require_relative "validators/items"
    require_relative "validators/max_items"
    require_relative "validators/max_length"
    require_relative "validators/max_properties"
    require_relative "validators/maximum"
    require_relative "validators/min_items"
    require_relative "validators/min_length"
    require_relative "validators/min_properties"
    require_relative "validators/minimum"
    require_relative "validators/multiple_of"
    require_relative "validators/pattern"
    require_relative "validators/properties"
    require_relative "validators/required"
    require_relative "validators/type"
    require_relative "validators/unique_items"
    require_relative "validators/xml"
  end
end
