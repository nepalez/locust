RSpec.describe Locust::Keywords::Pattern do
  subject { described_class.call source, parent }

  let(:parent) { double :parent }
  let(:source) { "foo" }

  its(:keyword) { is_expected.to eq "pattern" }
  its(:parent)  { is_expected.to eq parent }
  its(:source)  { is_expected.to eq source }

  it "has a proper matcher" do
    expect(subject.matcher).to     match "foobar"
    expect(subject.matcher).not_to match "barbaz"
  end
end
