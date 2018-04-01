RSpec.describe Locust::Keywords::ExclusiveMaximum do
  let(:keyword) { described_class.call source, parent }
  let(:source)  { true }
  let(:parent) do
    Locust::Keywords::Object.call({ type: "number", maximum: 10 }, nil)
  end

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "exclusiveMaximum" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when parent describes an integer" do
      let(:parent) do
        Locust::Keywords::Object.call({ type: "integer", maximum: 3 }, nil)
      end

      it { is_expected.to eq [] }
    end

    context "when parent describes neither integer nor a number" do
      let(:parent) do
        Locust::Keywords::Object.call({ type: "string", maximum: 3 }, nil)
      end

      it { is_expected.not_to be_empty }
    end

    context "when parent has no maximum" do
      let(:parent) { Locust::Keywords::Object.call({ type: "number" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when source is the false value" do
      let(:source) { false }

      it { is_expected.to eq [] }
    end

    context "when source is not a boolean" do
      let(:source) { 12 }

      it { is_expected.not_to be_empty }
    end
  end
end
