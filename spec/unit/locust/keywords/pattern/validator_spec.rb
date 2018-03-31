RSpec.describe Locust::Keywords::Pattern::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:parent_type) { double value: "string" }
  let(:parent) { double :parent, type: parent_type }
  let(:source) { "foo" }
  let(:schema) do
    double parent: parent, source: source, full_path: "foo.pattern"
  end

  context "when a parent describes a string" do
    it { is_expected.to eq [] }
  end

  context "when a parent describes not a string" do
    let(:parent_type) { double value: "object" }

    it { is_expected.not_to be_empty }
  end

  context "when a source is not a string" do
    let(:source) { -12 }

    it { is_expected.not_to be_empty }
  end
end
