RSpec.describe Locust::Schema::AdditionalProperties do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { { "type" => "null" } }

  its(:keyword) { is_expected.to eq "additionalProperties" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
  its(:schema)  { is_expected.to be_kind_of Locust::Schema::Object }

  its(:"schema.source") { is_expected.to eq source }
  its(:"schema.parent") { is_expected.to eq subject }
end
