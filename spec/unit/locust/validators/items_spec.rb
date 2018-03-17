RSpec.describe Locust::Validators::Items do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with a list of object schemas" do
      let(:source) { [{ "type" => "null" }, { "type" => "file" }] }

      its(:parent) { is_expected.to eq parent }
      its(:count)  { is_expected.to eq 2 }
      its("first.type") { is_expected.to eq "null" }
      its("last.type")  { is_expected.to eq "file" }
    end

    context "with an empty list" do
      let(:source) { [] }
      it { is_expected.to eq [] }
    end

    context "with a list containing invalid object schema" do
      let(:source) { [{ "type" => "null" }, { "title" => "file" }] }

      it "raises Locust::InvalidSchemaError" do
        expect { subject }.to raise_error(Locust::InvalidSchemaError)
      end
    end
  end

  describe "#errors" do
    subject { validator.errors object, "x" }

    let(:source) { [{ "type" => "null" }, { "type" => "string" }] }

    context "when object is not an array" do
      let(:object) { { foo: nil } }
      it { is_expected.to be_empty }
    end

    context "when corresponding the items satisfy the requirement" do
      let(:object) { [nil, "foo", 12] }
      it { is_expected.to be_empty }
    end

    context "when some items break the requirement" do
      let(:object) { ["foo", nil, 12] }
      it { is_expected.not_to be_empty }
    end
  end
end
