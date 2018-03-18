RSpec.describe Locust::SchemaObject do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) { { "type" => "null" } }

  describe ".call" do
    subject { schema }

    it { is_expected.to be_instance_of described_class }
    its(:type) { is_expected.to eq "null" }
  end

  describe "#errors" do
    subject { schema.errors object, "x" }

    context "when object is nil" do
      let(:object) { nil }
      it { is_expected.to be_empty }
    end

    context "when object breaks the 'type' constraint" do
      let(:object) { "" }
      it { is_expected.not_to be_empty }
    end
  end
end
