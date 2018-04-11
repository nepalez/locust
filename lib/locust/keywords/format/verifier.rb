class Locust::Keywords::Format
  class Verifier < Locust::Verifier
    validate :integer_is_inside_the_limit
    validate :date_is_valid
    validate :date_time_is_valid
    validate :object_satisfies_custom_validators

    private

    def continue?
      errors.empty? && schema.validate.empty?
    end

    def integer_is_inside_the_limit
      return unless continue?
      return unless schema.source == "integer"
      return unless object.is_a? Integer
      return if (-2 ^ 31..2 ^ 31 - 1).include? object
      errors << message("Its value is outside of the 32-bit range.")
    end

    def date_is_valid
      return unless continue?
      return unless schema.source == "date"
      return unless object.is_a? String
      return if date
      errors << \
        message("Its value should be a valid date as defined by RFC3339.")
    end

    def date_time_is_valid
      return unless continue?
      return unless schema.source == "dateTime"
      return unless object.is_a? String
      return if date_time
      errors << \
        message("Its value should be a valid dateTime as defined by RFC3339.")
    end

    def object_satisfies_custom_validators
      return unless continue?
      return unless custom
      return if custom.check(object)
      errors << message
    end

    def custom
      @custom ||= schema.config&.formats&.[](schema.source)
    end

    def date
      Date.parse(object)
    rescue
      nil
    end

    def date_time
      DateTime.parse(object)
    rescue
      nil
    end
  end
end
