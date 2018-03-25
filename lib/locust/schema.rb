class Locust
  #
  # @private
  # Namespace for different nodes of a specification schema
  #
  module Schema
    require_relative "schema/additional_properties"
    require_relative "schema/all_of"
    require_relative "schema/const"
    require_relative "schema/default"
    require_relative "schema/enum"
    require_relative "schema/example"
    require_relative "schema/exclusive_maximum"
    require_relative "schema/exclusive_minimum"
    require_relative "schema/format"
    require_relative "schema/item"
    require_relative "schema/items"
    require_relative "schema/max_items"
    require_relative "schema/max_length"
    require_relative "schema/max_properties"
    require_relative "schema/maximum"
    require_relative "schema/min_items"
    require_relative "schema/min_length"
    require_relative "schema/min_properties"
    require_relative "schema/minimum"
    require_relative "schema/multiple_of"
    require_relative "schema/pattern"
    require_relative "schema/properties"
    require_relative "schema/property"
    require_relative "schema/required"
    require_relative "schema/type"
    require_relative "schema/unique_items"
    require_relative "schema/xml"
    require_relative "schema/object"
  end
end
