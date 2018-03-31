RSpec.describe Locust::Keywords::Item do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:data)   { { "type" => "null" } }
  let(:source) { { source: data, index: 13 } }

  describe ".call" do
    subject { schema }

    its(:keyword) { is_expected.to eq "items[13]" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq data }
    its(:index)   { is_expected.to eq 13 }
  end

  describe "#schema" do
    subject { schema.schema }

    it { is_expected.to be_kind_of Locust::Keywords::Object }
    its(:source) { is_expected.to eq data }
    its(:parent) { is_expected.to eq schema }
  end
end
