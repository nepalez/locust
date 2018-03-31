RSpec.describe Locust::Keywords::MaxProperties do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { 12 }

  its(:keyword) { is_expected.to eq "maxProperties" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
end
