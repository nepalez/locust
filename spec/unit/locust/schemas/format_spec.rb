RSpec.describe Locust::Schemas::Format do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { "email" }

  its(:keyword) { is_expected.to eq "format" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
end
