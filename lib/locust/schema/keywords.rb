class Locust::Schema
  #
  # @private
  # Namespace for coercers for schema keywords
  #
  module Keywords
    require_relative "keywords/enum"
    require_relative "keywords/format"
    require_relative "keywords/items"
    require_relative "keywords/pattern"
    require_relative "keywords/properties"
    require_relative "keywords/required"
    require_relative "keywords/xml"
  end
end
