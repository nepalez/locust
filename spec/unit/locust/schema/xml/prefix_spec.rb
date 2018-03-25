RSpec.describe Locust::Schema::XML::Prefix do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { "foo" }

  its(:keyword) { is_expected.to eq "prefix" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
end
