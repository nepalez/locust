class Locust::Keywords::Type
  #
  # Checks the type keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :source_is_a_primitive

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def source_is_a_primitive
      return if PRIMITIVES.include? source
      errors << message("The value of this keyword MUST be one of primitives:" \
                        " '#{PRIMITIVES.join("', '")}'")
    end

    PRIMITIVES = %w[boolean integer number string array object file].freeze
  end
end
