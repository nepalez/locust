class Locust::Keywords::Minimum
  class Verifier < Locust::Verifier
    validate :object_satisfies_the_limit

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(Numeric)
    end

    def exclusive?
      schema.parent&.exclusive_minimum&.source == true
    end

    def object_satisfies_the_limit
      return unless continue?
      return if object > schema.source
      return if !exclusive? && object == schema.source
      errors << message
    end
  end
end
