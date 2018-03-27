RSpec.describe Locust::Schemas::XML::Name do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { "foo" }

  its(:keyword) { is_expected.to eq "name" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
end
