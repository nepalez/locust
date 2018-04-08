class Locust::Keywords::Not
  class Verifier < Locust::Verifier
    validate :object_breaks_the_schema

    private

    def object_breaks_the_schema
      return unless schema.schema
      return if schema.schema.verify(object).any?
      errors << message("It should fail to validate against the schema.")
    end
  end
end
