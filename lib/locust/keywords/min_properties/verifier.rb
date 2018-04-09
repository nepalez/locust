class Locust::Keywords::MinProperties
  class Verifier < Locust::Verifier
    validate :number_of_properties_satisfies_the_limit

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(Hash)
    end

    def number_of_properties_satisfies_the_limit
      return unless continue?
      return if object.keys.count >= schema.source
      errors << message
    end
  end
end
