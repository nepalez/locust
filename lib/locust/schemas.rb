class Locust
  #
  # @private
  # Namespace for different nodes of a specification schemas
  #
  module Schemas
    require_relative "schemas/base"
    require_relative "schemas/additional_properties"
    require_relative "schemas/all_of"
    require_relative "schemas/const"
    require_relative "schemas/default"
    require_relative "schemas/enum"
    require_relative "schemas/example"
    require_relative "schemas/exclusive_maximum"
    require_relative "schemas/exclusive_minimum"
    require_relative "schemas/format"
    require_relative "schemas/item"
    require_relative "schemas/items"
    require_relative "schemas/max_items"
    require_relative "schemas/max_length"
    require_relative "schemas/max_properties"
    require_relative "schemas/maximum"
    require_relative "schemas/min_items"
    require_relative "schemas/min_length"
    require_relative "schemas/min_properties"
    require_relative "schemas/minimum"
    require_relative "schemas/multiple_of"
    require_relative "schemas/pattern"
    require_relative "schemas/properties"
    require_relative "schemas/property"
    require_relative "schemas/required"
    require_relative "schemas/type"
    require_relative "schemas/unique_items"
    require_relative "schemas/xml_attribute"
    require_relative "schemas/xml_name"
    require_relative "schemas/xml_namespace"
    require_relative "schemas/xml_prefix"
    require_relative "schemas/xml_wrapped"
    require_relative "schemas/xml"
    require_relative "schemas/object"
  end
end
