RSpec.describe Locust::Schema::Required do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { %i[foo bar] }

  its(:keyword) { is_expected.to eq "required" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }
  its(:list)    { is_expected.to eq %w[foo bar] }
end
