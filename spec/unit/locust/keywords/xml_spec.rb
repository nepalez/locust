RSpec.describe Locust::Keywords::Xml do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "array" }, nil) }
  let(:source) do
    {
      name:      "foo",
      namespace: "https://example.com",
      prefix:    "baz",
      attribute: true,
      wrapped:   true,
    }
  end

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "xml" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#name" do
    subject { keyword.name }

    it { is_expected.to be_a Locust::Keywords::XmlName }
    its(:parent) { is_expected.to eq keyword }
    its(:source) { is_expected.to eq source[:name] }
  end

  describe "#namespace" do
    subject { keyword.namespace }

    it { is_expected.to be_a Locust::Keywords::XmlNamespace }
    its(:parent) { is_expected.to eq keyword }
    its(:source) { is_expected.to eq source[:namespace] }
  end

  describe "#prefix" do
    subject { keyword.prefix }

    it { is_expected.to be_a Locust::Keywords::XmlPrefix }
    its(:parent) { is_expected.to eq keyword }
    its(:source) { is_expected.to eq source[:prefix] }
  end

  describe "#attribute" do
    subject { keyword.attribute }

    it { is_expected.to be_a Locust::Keywords::XmlAttribute }
    its(:parent) { is_expected.to eq keyword }
    its(:source) { is_expected.to eq source[:attribute] }
  end

  describe "#wrapped" do
    subject { keyword.wrapped }

    it { is_expected.to be_a Locust::Keywords::XmlWrapped }
    its(:parent) { is_expected.to eq keyword }
    its(:source) { is_expected.to eq source[:wrapped] }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when some option is invalid" do
      before { source[:namespace] = "/foo" }

      it { is_expected.not_to be_empty }
    end
  end
end
