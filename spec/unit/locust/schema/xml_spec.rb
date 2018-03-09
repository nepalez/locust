RSpec.describe Locust::Schema::XML do
  let(:xml) { described_class.call source }
  let(:source) do
    {
      name:      :foo,
      namespace: :bar,
      prefix:    :baz,
      attribute: true,
      wrapped:   true,
    }
  end

  describe ".call" do
    subject { xml }

    context "with data" do
      its(:name)      { is_expected.to eq "foo" }
      its(:namespace) { is_expected.to eq "bar" }
      its(:prefix)    { is_expected.to eq "baz" }
      its(:attribute) { is_expected.to eq true }
      its(:wrapped)   { is_expected.to eq true }
    end

    context "by default" do
      let(:source) { nil }

      its(:name)      { is_expected.to be_nil }
      its(:namespace) { is_expected.to be_nil }
      its(:prefix)    { is_expected.to be_nil }
      its(:attribute) { is_expected.to eq false }
      its(:wrapped)   { is_expected.to eq false }
    end
  end
end
