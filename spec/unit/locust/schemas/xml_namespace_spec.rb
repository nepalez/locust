RSpec.describe Locust::Schemas::XmlNamespace do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { "http://example.com/foo" }

  its(:keyword) { is_expected.to eq "namespace" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
  its(:uri)     { is_expected.to eq URI(source) }
end
