RSpec.describe Locust::Schema::Items do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:data)   { { "type" => "null" } }

  context "with a single hash" do
    let(:source) { data }

    its(:keyword) { is_expected.to eq "items" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
    its(:list)    { is_expected.to eq [] }
    its(:schema)  { is_expected.to be_kind_of Locust::Schema::Object }
    its(:"schema.source") { is_expected.to eq data }
    its(:"schema.parent") { is_expected.to eq subject }
  end

  context "with an array of hashes" do
    let(:source) { [data] }

    its(:schema) { is_expected.to be_nil }
    its(:list)   { is_expected.not_to be_empty }
    its(:"list.first") { is_expected.to be_kind_of Locust::Schema::Item }
    its(:"list.first.parent") { is_expected.to eq parent }
    its(:"list.first.index")  { is_expected.to eq 0 }
    its(:"list.first.schema.source") { is_expected.to eq data }
  end

  context "with neither hash nor an array" do
    let(:source) { 3 }

    its(:schema) { is_expected.to be_nil }
    its(:list)   { is_expected.to be_empty }
  end
end
