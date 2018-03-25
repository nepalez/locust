RSpec.describe Locust::Schema::MinProperties do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { 12 }

  its(:keyword) { is_expected.to eq "minProperties" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
end
