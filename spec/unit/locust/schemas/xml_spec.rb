RSpec.describe Locust::Schemas::Xml do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) do
    {
      name:      "foo",
      namespace: "bar",
      prefix:    "baz",
      attribute: true,
      wrapped:   true,
    }
  end

  describe ".call" do
    subject { schema }

    its(:keyword) { is_expected.to eq "xml" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "name" do
    subject { schema.name }

    it { is_expected.to be_a Locust::Schemas::XmlName }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source[:name] }
  end

  describe "namespace" do
    subject { schema.namespace }

    it { is_expected.to be_a Locust::Schemas::XmlNamespace }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source[:namespace] }
  end

  describe "prefix" do
    subject { schema.prefix }

    it { is_expected.to be_a Locust::Schemas::XmlPrefix }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source[:prefix] }
  end

  describe "attribute" do
    subject { schema.attribute }

    it { is_expected.to be_a Locust::Schemas::XmlAttribute }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source[:attribute] }
  end

  describe "wrapped" do
    subject { schema.wrapped }

    it { is_expected.to be_a Locust::Schemas::XmlWrapped }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source[:wrapped] }
  end
end
