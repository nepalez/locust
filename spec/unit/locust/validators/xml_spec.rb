RSpec.describe Locust::Validators::XML do
  let(:validator) { described_class.call source, parent }
  let(:parent)    { double :parent }

  describe ".call" do
    subject { validator }

    context "with data" do
      let(:source) do
        {
          name:      :foo,
          namespace: :bar,
          prefix:    :baz,
          attribute: true,
          wrapped:   true,
        }
      end

      its(:parent)    { is_expected.to eq parent }
      its(:name)      { is_expected.to eq "foo" }
      its(:namespace) { is_expected.to eq "bar" }
      its(:prefix)    { is_expected.to eq "baz" }
      its(:attribute) { is_expected.to eq true }
      its(:wrapped)   { is_expected.to eq true }
    end

    context "by default" do
      let(:source) { nil }

      its(:parent)    { is_expected.to eq parent }
      its(:name)      { is_expected.to be_nil }
      its(:namespace) { is_expected.to be_nil }
      its(:prefix)    { is_expected.to be_nil }
      its(:attribute) { is_expected.to be_nil }
      its(:wrapped)   { is_expected.to be_nil }
    end
  end
end
