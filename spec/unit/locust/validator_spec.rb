RSpec.describe Locust::Validator do
  let(:klass) do
    Class.new(described_class) do
      validate do
        errors << "#{message} It MUST be a string" unless source.is_a? String
      end

      validate :allowed_value

      private

      def allowed_value
        return if errors.any?
        errors << "Wrong value '#{source}'" unless %w[foo bar].include? source
      end
    end
  end

  describe ".call" do
    subject { klass.call(schema) }

    context "with a valid schema" do
      let(:schema) { double source: "foo", full_path: "format" }

      it { is_expected.to eq [] }
    end

    context "with a schema that broke inline validator" do
      let(:schema) { double source: :foo, full_path: "format" }

      it "returns expected errors" do
        expect(subject)
          .to eq ["Invalid schema at 'format'. It MUST be a string"]
      end
    end

    context "with a schema that broke method validator" do
      let(:schema) { double source: "baz", full_path: "format" }

      it "returns expected errors" do
        expect(subject).to eq ["Wrong value 'baz'"]
      end
    end
  end
end
