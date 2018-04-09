class Locust::Keywords::MinLength
  class Verifier < Locust::Verifier
    validate :object_length_satisfies_the_limit

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(String)
    end

    def object_length_satisfies_the_limit
      return unless continue?
      return if object.length >= schema.source
      errors << message
    end
  end
end
