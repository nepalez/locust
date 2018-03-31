RSpec.describe Locust::Keywords::Required do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) { %i[foo bar] }

  describe ".call" do
    subject { schema }

    its(:keyword) { is_expected.to eq "required" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#data" do
    subject { schema.data }

    it { is_expected.to eq %w[foo bar] }
  end
end
