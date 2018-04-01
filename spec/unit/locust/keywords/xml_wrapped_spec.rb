RSpec.describe Locust::Keywords::XmlWrapped do
  let(:keyword) { described_class.call source, parent}
  let(:object)  { Locust::Keywords::Object.call({ type: "array" }, nil) }
  let(:parent)  { Locust::Keywords::Xml.call(nil, object) }
  let(:source)  { true }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "wrapped"}
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when source is the false value" do
      let(:source) { "" }

      it { is_expected.not_to be_empty }
    end

    context "when source is not a boolean" do
      let(:source) { 32 }

      it { is_expected.not_to be_empty }
    end

    context "when parent describes not an array" do
      let(:object) { Locust::Keywords::Object.call({ type: "string" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an xml definition" do
      let(:parent) { Locust::Keywords::Object.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end
  end
end
