class Locust::Keywords::MaxProperties
  class Verifier < Locust::Verifier
    validate :number_of_properties_satisfies_the_limit

    private

    def number_of_properties_satisfies_the_limit
      return unless object.is_a? Hash
      return if object.keys.count <= schema.source
      errors << message
    end
  end
end
