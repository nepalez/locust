class Locust::Keywords::Maximum
  class Verifier < Locust::Verifier
    validate :object_satisfies_the_limit

    private

    def exclusive?
      schema.parent&.exclusive_maximum&.source == true
    end

    def object_satisfies_the_limit
      return unless object.is_a? Numeric
      return if object < schema.source
      return if !exclusive? && object == schema.source
      errors << message
    end
  end
end
