RSpec.describe Locust::Keywords::Not do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:data)   { { "type" => "null" } }
  let(:source) { { source: data } }

  describe ".call" do
    subject { schema }

    its(:keyword) { is_expected.to eq "not" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq data }
  end

  describe "#schema" do
    subject { schema.schema }

    it { is_expected.to be_kind_of Locust::Keywords::Object }
    its(:source) { is_expected.to eq data }
    its(:parent) { is_expected.to eq schema }
  end
end
