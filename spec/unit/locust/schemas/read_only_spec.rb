RSpec.describe Locust::Schemas::ReadOnly do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { true }

  its(:keyword) { is_expected.to eq "readOnly"}
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
end
