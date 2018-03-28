RSpec.describe Locust::Validators::MinLength, ".call" do
  subject { described_class.call(schema) }

  let(:parent_type) { double value: "string" }
  let(:parent) { double :parent, type: parent_type }
  let(:source) { 12 }
  let(:schema) do
    double parent: parent, source: source, full_path: "foo.minLength"
  end

  context "when a parent describes a string" do
    it { is_expected.to eq [] }
  end

  context "when a parent describes not a string" do
    let(:parent_type) { double value: "object" }

    it { is_expected.not_to be_empty }
  end

  context "when a source is negative" do
    let(:source) { -12 }

    it { is_expected.not_to be_empty }
  end

  context "when a source is zero" do
    let(:source) { 0 }

    it { is_expected.to eq [] }
  end

  context "when a source is not an integer" do
    let(:source) { 12.5 }

    it { is_expected.not_to be_empty }
  end
end
