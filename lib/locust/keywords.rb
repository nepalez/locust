class Locust
  #
  # @private
  # Namespace for different nodes of a specification keywords
  #
  module Keywords
    require_relative "keywords/additional_properties"
    require_relative "keywords/all_of"
    require_relative "keywords/any_of"
    require_relative "keywords/default"
    require_relative "keywords/enum"
    require_relative "keywords/exclusive_maximum"
    require_relative "keywords/exclusive_minimum"
    require_relative "keywords/format"
    require_relative "keywords/item"
    require_relative "keywords/items"
    require_relative "keywords/max_items"
    require_relative "keywords/max_length"
    require_relative "keywords/max_properties"
    require_relative "keywords/maximum"
    require_relative "keywords/min_items"
    require_relative "keywords/min_length"
    require_relative "keywords/min_properties"
    require_relative "keywords/minimum"
    require_relative "keywords/multiple_of"
    require_relative "keywords/not"
    require_relative "keywords/nullable"
    require_relative "keywords/one_of"
    require_relative "keywords/pattern"
    require_relative "keywords/properties"
    require_relative "keywords/property"
    require_relative "keywords/required"
    require_relative "keywords/type"
    require_relative "keywords/unique_items"
    require_relative "keywords/xml_attribute"
    require_relative "keywords/xml_name"
    require_relative "keywords/xml_namespace"
    require_relative "keywords/xml_prefix"
    require_relative "keywords/xml_wrapped"
    require_relative "keywords/xml"
    require_relative "keywords/object"
  end
end
