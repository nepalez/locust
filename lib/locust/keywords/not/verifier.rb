class Locust::Keywords::Not
  class Verifier < Locust::Verifier
    validate :object_breaks_the_schema

    private

    def continue?
      errors.empty? && schema.validate.empty?
    end

    def object_breaks_the_schema
      return unless continue?
      return if schema.schema.verify(object).any?
      errors << message("It should fail to validate against the schema.")
    end
  end
end
