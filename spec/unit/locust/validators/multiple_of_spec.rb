RSpec.describe Locust::Validators::MultipleOf, ".call" do
  subject { described_class.call(schema) }

  let(:parent_type) { double value: "integer" }
  let(:parent) { double :parent, type: parent_type }
  let(:source) { 12.4 }
  let(:schema) do
    double parent: parent, source: source, full_path: "foo.multipleOf"
  end

  context "when a parent describes an ingeger" do
    it { is_expected.to eq [] }
  end

  context "when a parent describes a number" do
    let(:parent_type) { double value: "number" }

    it { is_expected.to eq [] }
  end

  context "when a parent describes not a numeric" do
    let(:parent_type) { double value: "array" }

    it { is_expected.not_to be_empty }
  end

  context "when a source is zero" do
    let(:source) { 0 }

    it { is_expected.not_to be_empty }
  end

  context "when a source is negative" do
    let(:source) { -1 }

    it { is_expected.not_to be_empty }
  end

  context "when a source is not a number" do
    let(:source) { :foo }

    it { is_expected.not_to be_empty }
  end
end
