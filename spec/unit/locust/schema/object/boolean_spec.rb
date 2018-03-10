RSpec.describe Locust::Schema::Object do
  subject { described_class.call schema }

  let(:schema) { { "type" => "boolean" } }

  it { is_expected.to be_kind_of described_class }
  it { is_expected.to be_kind_of described_class::Boolean }
  its(:type) { is_expected.to eq "boolean" }
end
