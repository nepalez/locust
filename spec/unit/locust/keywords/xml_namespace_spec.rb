RSpec.describe Locust::Keywords::XmlNamespace do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Xml.call(nil, nil) }
  let(:source)  { "http://example.com/foo" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "namespace" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
    its(:uri)     { is_expected.to eq URI(source) }
  end

  describe "#validate" do
    subject { keyword.validate }

    context "with an absolute uri" do
      let(:source) { "https://example.com" }

      it { is_expected.to eq [] }
    end

    context "with a relative uri" do
      let(:source) { "/foo/bar" }

      it { is_expected.not_to be_empty }
    end

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
