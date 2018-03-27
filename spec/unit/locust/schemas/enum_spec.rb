RSpec.describe Locust::Schemas::Enum do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { %w[foo bar] }

  its(:keyword) { is_expected.to eq "enum" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
end
