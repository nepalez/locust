RSpec.describe Locust::Schemas::Const do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { "FOO" }

  its(:keyword) { is_expected.to eq "const" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
end
