class Locust
  #
  # @private
  # Namespace for schema keywords with a getter/setter of the keyword name
  #
  # @example
  #   extend Keywords
  #
  module Keywords
    #
    # Gets or sets the name of the keyword
    #
    # @param  [#to_s] value
    # @return [String]
    #
    def keyword(value = nil)
      (value ? @keyword = value.to_s : @keyword) || raise(::NotImplementedError)
    end

    # Base classes for keywords
    require_relative "keywords/base"
    require_relative "keywords/base_boolean"
    require_relative "keywords/base_number"
    require_relative "keywords/base_positive"
    require_relative "keywords/base_string"

    # Specific keywords definition
    require_relative "keywords/additional_properties"
    require_relative "keywords/const"
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
    require_relative "keywords/pattern"
    require_relative "keywords/properties"
    require_relative "keywords/required"
    require_relative "keywords/type"
    require_relative "keywords/unique_items"
    require_relative "keywords/xml"
  end
end
