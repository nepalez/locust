RSpec.describe Locust::Verifier do
  let(:klass) do
    Class.new(described_class) do
      validate :object_has_a_proper_type

      private

      def object_has_a_proper_type
        return if schema.klass === object
        errors << message("It has invalid type.")
      end
    end
  end

  describe "#call" do
    subject { klass.new(schema, object, "foo", 3).errors }

    let(:schema) { double klass: String, full_path: "foo.items.type" }

    context "with a valid object" do
      let(:object) { "FOO" }

      it { is_expected.to eq [] }
    end

    context "with invalid object" do
      let(:object) { 3 }

      it "returns expected errors" do
        expect(subject).to eq [
          "The object 'foo[3]' does not satisfy the schema 'foo.items.type'." \
          " It has invalid type."
        ]
      end
    end
  end
end
