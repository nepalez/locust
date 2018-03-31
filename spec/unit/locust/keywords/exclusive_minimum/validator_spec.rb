RSpec.describe Locust::Keywords::ExclusiveMinimum::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:parent) { double options: { type: "integer", minimum: 32 } }
  let(:source) { true }
  let(:schema) do
    double source: source, parent: parent, full_path: "exclusiveMinimum"
  end

  context "when parent has a minimum" do
    it { is_expected.to eq [] }
  end

  context "when parent has no minimum" do
    let(:parent) { double options: { type: "integer" } }

    it { is_expected.not_to be_empty }
  end

  context "when a value is not a boolean" do
    let(:source) { 12 }

    it { is_expected.not_to be_empty }
  end
end
