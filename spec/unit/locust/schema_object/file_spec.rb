RSpec.describe Locust::SchemaObject do
  subject { described_class.call schema }

  let(:schema) { { "type" => "file" } }

  it { is_expected.to be_kind_of described_class }
  it { is_expected.to be_kind_of described_class::File }
  its(:type) { is_expected.to eq "file" }
end
