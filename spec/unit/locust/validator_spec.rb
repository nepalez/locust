RSpec.describe Locust::Validator do
  let(:klass) do
    Class.new(described_class) do
      validate :source_is_a_string
      validate :allowed_value

      private

      def source_is_a_string
        errors << "#{message} It MUST be a string" unless source.is_a? String
      end

      def allowed_value
        return if errors.any?
        errors << "Wrong value '#{source}'" unless %w[foo bar].include? source
      end
    end
  end

  describe "#call" do
    subject { klass.new(schema).errors }

    context "with a valid schema" do
      let(:schema) { double source: "foo", full_path: "format" }

      it { is_expected.to eq [] }
    end

    context "with an invalid schema" do
      let(:schema) { double source: "baz", full_path: "format" }

      it "returns expected errors" do
        expect(subject).to eq ["Wrong value 'baz'"]
      end
    end
  end
end
