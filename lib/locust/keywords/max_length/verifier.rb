class Locust::Keywords::MaxLength
  class Verifier < Locust::Verifier
    validate :object_length_satisfies_the_limit

    private

    def object_length_satisfies_the_limit
      return unless object.is_a? String
      return if object.length <= schema.source
      errors << message
    end
  end
end
