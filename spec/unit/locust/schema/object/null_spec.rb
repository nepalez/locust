RSpec.describe Locust::Schema::Object do
  subject { described_class.call schema }

  let(:schema) { { "type" => "null" } }

  it { is_expected.to be_kind_of described_class }
  it { is_expected.to be_kind_of described_class::Null }
  its(:type) { is_expected.to eq "null" }
end
