RSpec.describe Locust::Keywords::Nullable do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "array" }, nil) }
  let(:source)  { true }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "nullable" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when source is the false value" do
      let(:source) { false }

      it { is_expected.to eq [] }
    end

    context "when source is not a boolean" do
      let(:source) { "foo" }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end
  end
end
