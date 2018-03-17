RSpec.describe Locust::Validators::Item do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with a valid schema" do
      let(:source) { { "type" => "null" } }

      its(:parent) { is_expected.to eq parent }
      its(:type)   { is_expected.to eq "null" }
    end

    context "with an invalid object schema" do
      let(:source) { { "title" => "file" } }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end

  describe "#errors" do
    subject { validator.errors object, "x" }

    let(:source) { { "type" => "null" } }

    context "when object is not an array" do
      let(:object) { { foo: nil } }
      it { is_expected.to be_empty }
    end

    context "when all the items satisfy the requirement" do
      let(:object) { [nil, nil] }
      it { is_expected.to be_empty }
    end

    context "when some items break the requirement" do
      let(:object) { [nil, "foo"] }
      it { is_expected.not_to be_empty }
    end
  end
end
