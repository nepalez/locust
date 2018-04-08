RSpec.describe Locust::Keywords::AnyOf do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "object" }, nil) }
  let(:source)  { [{ type: "string" }, { type: "integer" }] }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "anyOf" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#data" do
    subject { keyword.data }

    its(:count) { is_expected.to eq 2 }
  end

  describe "#[]" do
    subject { keyword.data[0] }

    it { is_expected.to be_a Locust::Keywords::Object }
    its(:parent) { is_expected.to eq parent }
    its(:source) { is_expected.to eq source[0] }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when source is empty" do
      let(:source) { [] }

      it { is_expected.not_to be_empty }
    end

    context "when source is not an array" do
      let(:source) { 1 }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when some source is not a valid schema" do
      let(:source) { [{ type: "string" }, { format: "email" }] }

      it { is_expected.not_to be_empty }
    end
  end
end
