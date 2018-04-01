RSpec.describe Locust::Keywords::XmlName do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Xml.call(nil, nil) }
  let(:source)  { "foo" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "name" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "with the empty string" do
      let(:source) { "" }

      it { is_expected.not_to be_empty }
    end

    context "with a non-string" do
      let(:source) { 32 }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an xml definition" do
      let(:parent) { Locust::Keywords::Object.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end
  end
end
