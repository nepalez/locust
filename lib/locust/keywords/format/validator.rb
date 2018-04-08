class Locust::Keywords::Format
  #
  # Checks the type keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :source_is_a_string
    validate :source_is_not_empty
    validate :integer_is_an_integer
    validate :long_is_an_integer
    validate :float_is_a_number
    validate :double_is_a_number
    validate :boolean_is_a_boolean
    validate :byte_is_a_string
    validate :binary_is_a_string
    validate :password_is_a_string
    validate :string_is_a_string
    validate :date_is_a_string
    validate :date_time_is_a_string

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def source_is_a_string
      return if source.is_a?(String)
      errors << message("Its value MUST be a string.")
    end

    def source_is_not_empty
      return if errors.any?
      return unless source == ""
      errors << message("Its value MUST not be empty.")
    end

    def integer_is_an_integer
      return if errors.any?
      return unless source == "integer"
      return if type == "integer"
      errors << \
        message("This format MAY be added to a schema describing an integer.")
    end

    def long_is_an_integer
      return if errors.any?
      return unless source == "long"
      return if type == "integer"
      errors << \
        message("This format MAY be added to a schema describing an integer.")
    end

    def float_is_a_number
      return if errors.any?
      return unless source == "float"
      return if type == "number"
      errors << \
        message("This format MAY be added to a schema describing a number.")
    end

    def double_is_a_number
      return if errors.any?
      return unless source == "double"
      return if type == "number"
      errors << \
        message("This format MAY be added to a schema describing a number.")
    end

    def boolean_is_a_boolean
      return if errors.any?
      return unless source == "boolean"
      return if type == "boolean"
      errors << \
        message("This format MAY be added to a schema describing a boolean.")
    end

    def byte_is_a_string
      return if errors.any?
      return unless source == "byte"
      return if type == "string"
      errors << \
        message("This format MAY be added to a schema describing a string.")
    end

    def binary_is_a_string
      return if errors.any?
      return unless source == "binary"
      return if type == "string"
      errors << \
        message("This format MAY be added to a schema describing a string.")
    end

    def password_is_a_string
      return if errors.any?
      return unless source == "password"
      return if type == "string"
      errors << \
        message("This format MAY be added to a schema describing a string.")
    end

    def string_is_a_string
      return if errors.any?
      return unless source == "string"
      return if type == "string"
      errors << \
        message("This format MAY be added to a schema describing a string.")
    end

    def date_is_a_string
      return if errors.any?
      return unless source == "date"
      return if type == "string"
      errors << \
        message("This format MAY be added to a schema describing a string.")
    end

    def date_time_is_a_string
      return if errors.any?
      return unless source == "dateTime"
      return if type == "string"
      errors << \
        message("This format MAY be added to a schema describing a string.")
    end

    def type
      @type ||= parent.type&.source
    end
  end
end
