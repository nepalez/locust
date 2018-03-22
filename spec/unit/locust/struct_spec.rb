RSpec.describe Locust::Struct do
  let(:klass)  { Class.new(described_class) { option :bar; option :qux } }
  let(:parent) { double }
  let(:struct) { klass.new parent, "bar" => :BAZ, foo: :FOO, qux: other }
  let(:other)  { klass.new parent, {} }

  describe ".new" do
    subject { struct }

    its(:parent) { is_expected.to eq parent }
    its(:bar)    { is_expected.to eq :BAZ }
    its(:qux)    { is_expected.to eq other }

    context "without options" do
      subject { other }

      its(:bar) { is_expected.to be_nil }
      its(:qux) { is_expected.to be_nil }
    end

    context "with a pre-initialized struct" do
      subject { klass.new parent, other }

      it { is_expected.to eq other }
    end
  end

  describe ".call" do
    subject { klass.call({ "bar" => :BAZ }, parent) }

    its(:parent) { is_expected.to eq parent }
    its(:bar)    { is_expected.to eq :BAZ }
  end

  describe "#options" do
    context "with unexpected options" do
      subject { struct.options }

      it { is_expected.to eq bar: :BAZ, qux: other }
    end

    context "with skipped options" do
      subject { other.options }

      it { is_expected.to eq({}) }
    end
  end

  describe "#children" do
    context "with some sub-structs" do
      subject { struct.children }

      it { is_expected.to eq [other] }
    end

    context "without any sub-structs" do
      subject { other.children }

      it { is_expected.to eq [] }
    end
  end
end
