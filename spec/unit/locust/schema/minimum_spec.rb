RSpec.describe Locust::Schema::Minimum do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { 12 }

  its(:keyword) { is_expected.to eq "minimum" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
end
