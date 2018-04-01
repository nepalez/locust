RSpec.describe Locust::Keywords::Default do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { double :parent }
  let(:source)  { "FOO" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "default" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end
end
