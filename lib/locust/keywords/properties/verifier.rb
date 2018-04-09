class Locust::Keywords::Properties
  class Verifier < Locust::Verifier
    validate :all_properties_satisfy_their_schemas

    private

    def all_properties_satisfy_their_schemas
      return unless object.is_a? Hash
      object.each do |key, val|
        key = key.to_s
        verifier = schema.schemas[key]
        next unless verifier
        errors.concat verifier.verify(val, *path, key)
      end
    end
  end
end
