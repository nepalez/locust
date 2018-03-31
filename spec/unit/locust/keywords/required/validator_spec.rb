RSpec.describe Locust::Keywords::Required::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double parent: parent, source: source, full_path: "required" }
  let(:source)      { %w[id name] }
  let(:parent_type) { double value: "object" }
  let(:parent)      { double :parent, type: parent_type }

  context "when a parent describes an object" do
    it { is_expected.to eq [] }
  end

  context "when a parent describes not an object" do
    let(:parent_type) { double value: "array" }

    it { is_expected.not_to be_empty }
  end

  context "when a source contains non-strings" do
    let(:source) { ["id", 1] }

    it { is_expected.not_to be_empty }
  end

  context "when a source contains repetitive values" do
    let(:source) { %w[id name name] }

    it { is_expected.not_to be_empty }
  end

  context "when a source is an empty array" do
    let(:source) { [] }

    it { is_expected.not_to be_empty }
  end

  context "when a source is not an array" do
    let(:source) { "id" }

    it { is_expected.not_to be_empty }
  end
end
