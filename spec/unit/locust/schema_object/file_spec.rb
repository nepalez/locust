RSpec.describe Locust::SchemaObject do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) { { "type" => "file" } }

  describe ".call" do
    subject { schema }

    it { is_expected.to be_instance_of described_class }
    its(:type) { is_expected.to eq "file" }
  end
end
