RSpec.describe Locust::Keywords::AdditionalProperties do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent, properties: nil }

  describe ".call" do
    subject { validator }

    context "with a valid schema" do
      let(:source) { { "type" => "null" } }
      its(:type)   { is_expected.to eq "null" }
    end

    context "with an invalid object schema" do
      let(:source) {  { "title" => "file" } }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end

  describe "#errors" do
    subject { validator.errors object, "x" }

    let(:source) { { "type" => "string" } }
    let(:parent) do
      double :parent, properties: { "foo" => { type: "null" } }
    end

    context "when object is not a hash" do
      let(:object) { %w[foo bar] }
      it { is_expected.to be_empty }
    end

    context "when all properties satisfy the requirements" do
      let(:object) do
        {
          "foo" => "foo",
          "bar" => "bar",
          "qux" => "baz",
        }
      end

      it { is_expected.to be_empty }
    end

    context "when explicitly specified properties break the requirement" do
      let(:object) do
        {
          "foo" => nil,
          "bar" => "bar",
          "qux" => "baz",
        }
      end

      it { is_expected.to be_empty }
    end

    context "when unspecified properties break the requirement" do
      let(:object) do
        {
          "foo" => "foo",
          "bar" => "bar",
          "qux" => nil,
        }
      end

      it { is_expected.not_to be_empty }
    end
  end
end
