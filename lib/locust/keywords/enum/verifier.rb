class Locust::Keywords::Enum
  class Verifier < Locust::Verifier
    validate :object_is_one_of_enums

    private

    def object_is_one_of_enums
      return if Array(schema.source).include? object
      errors << message
    end
  end
end
