RSpec.describe Locust::Schemas::Item do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:data)   { { "type" => "null" } }
  let(:source) { { source: data, index: 13 } }

  its(:keyword) { is_expected.to eq "items[13]" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq data }
  its(:index)   { is_expected.to eq 13 }
  its(:schema)  { is_expected.to be_kind_of Locust::Schemas::Object }

  its(:"schema.source") { is_expected.to eq data }
  its(:"schema.parent") { is_expected.to eq subject }
end
