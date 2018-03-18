RSpec.describe Locust::SchemaObject do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) { { "type" => "boolean" } }

  describe ".call" do
    subject { schema }

    it { is_expected.to be_instance_of described_class }
    its(:type) { is_expected.to eq "boolean" }
  end

  describe "#errors" do
    subject { schema.errors object, "x" }

    context "when object is true" do
      let(:object) { true }
      it { is_expected.to be_empty }
    end

    context "when object is false" do
      let(:object) { false }
      it { is_expected.to be_empty }
    end

    context "when object breaks the 'const' constraint" do
      before { source["const"] = true }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'enum' constraint" do
      before { source["enum"] = [true] }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'type' constraint" do
      let(:object) { nil }
      it { is_expected.not_to be_empty }
    end
  end
end
