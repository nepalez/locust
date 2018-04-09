class Locust::Keywords::Property
  class Verifier < Locust::Verifier
    validate :object_satisfies_the_schema

    private

    def continue?
      errors.empty? && schema.validate.empty?
    end

    def object_satisfies_the_schema
      return unless continue?
      list = schema.schema.verify(object, *path)
      errors.concat list
    end
  end
end
