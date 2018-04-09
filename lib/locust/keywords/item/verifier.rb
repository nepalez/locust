class Locust::Keywords::Item
  class Verifier < Locust::Verifier
    validate :object_satisfies_the_schema

    private

    def object_satisfies_the_schema
      return unless schema.schema
      list = schema.schema.verify(object, *path)
      errors.concat list
    end
  end
end
