class Locust::Keywords::MultipleOf
  class Verifier < Locust::Verifier
    validate :object_is_a_multiple_number

    private

    def object_is_a_multiple_number
      return unless object.is_a? Numeric
      return if (object % schema.source.to_f).zero?
      errors << message
    end
  end
end
