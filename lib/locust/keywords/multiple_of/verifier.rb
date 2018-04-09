class Locust::Keywords::MultipleOf
  class Verifier < Locust::Verifier
    validate :object_is_a_multiple_number

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(Numeric)
    end

    def object_is_a_multiple_number
      return unless continue?
      return if (object % schema.source.to_f).zero?
      errors << message
    end
  end
end
