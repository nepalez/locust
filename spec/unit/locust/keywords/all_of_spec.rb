RSpec.describe Locust::Keywords::AllOf do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) { [{ type: "string" }, { format: "email" }] }

  describe ".call" do
    subject { schema }

    its(:keyword) { is_expected.to eq "allOf" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#data" do
    subject { schema.data }

    its(:count) { is_expected.to eq 2 }
  end

  describe "#[]" do
    subject { schema.data[0] }

    it { is_expected.to be_a Locust::Keywords::Object }
    its(:parent) { is_expected.to eq parent }
    its(:source) { is_expected.to eq source[0] }
  end
end
