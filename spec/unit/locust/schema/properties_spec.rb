RSpec.describe Locust::Schema::Properties do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { { "foo" => data } }
  let(:data)   { { "type" => "null" }  }

  context "with a hash" do
    its(:keyword) { is_expected.to eq "properties" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
    its(:list)    { is_expected.not_to be_empty }

    its(:"list.first") { is_expected.to be_kind_of Locust::Schema::Property }
    its(:"list.first.parent") { is_expected.to eq parent }
    its(:"list.first.key")    { is_expected.to eq "foo" }
    its(:"list.first.source") { is_expected.to eq data }
  end

  context "with neither hash nor an array" do
    let(:source) { 3 }

    its(:keyword) { is_expected.to eq "properties" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
    its(:list)    { is_expected.to be_empty }
  end
end
