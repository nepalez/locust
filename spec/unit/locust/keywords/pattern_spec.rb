RSpec.describe Locust::Keywords::Pattern do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "string" }, nil) }
  let(:source)  { "foo" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "pattern" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }

    it "has a proper matcher" do
      expect(subject.matcher).to     match "foobar"
      expect(subject.matcher).not_to match "barbaz"
    end
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when parent describes not a string" do
      let(:parent) { Locust::Keywords::Object.call({ type: "number" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when source is not a string" do
      let(:source) { -12 }

      it { is_expected.not_to be_empty }
    end
  end
end
