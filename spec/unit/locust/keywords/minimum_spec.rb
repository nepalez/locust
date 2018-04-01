RSpec.describe Locust::Keywords::Minimum do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "number" }, nil) }
  let(:source)  { 12 }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "minimum" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when a parent describes an integer" do
      let(:parent) { Locust::Keywords::Object.call({ type: "integer" }, nil) }

      it { is_expected.to eq [] }
    end

    context "when a parent describes neither integer, nor a number" do
      let(:parent) { Locust::Keywords::Object.call({ type: "string" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when a parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when a source is not a number" do
      let(:source) { :foo }

      it { is_expected.not_to be_empty }
    end
  end
end
