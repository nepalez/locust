RSpec.describe Locust::SchemaObject do
  subject { described_class.call schema, parent }

  let(:parent) { double :parent }
  let(:schema) { { "type" => "boolean" } }

  it { is_expected.to be_instance_of described_class }
  its(:type) { is_expected.to eq "boolean" }
end
