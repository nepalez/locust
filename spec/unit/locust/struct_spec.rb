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

  describe "#ancestors" do
    subject { struct.ancestors }

    let(:struct)  { klass.new farther, {} }
    let(:farther) { klass.new grandpa, {} }
    let(:grandpa) { klass.new parent, {} }

    it "returns a list of struct ancestors" do
      expect(subject).to eq [grandpa, farther]
    end

    context "with no ancestors" do
      subject { grandpa.ancestors }
      it { is_expected.to eq [] }
    end
  end

  describe "#full_path" do
    subject { baz.full_path }

    before do
      class Foo < described_class
        struct { name "foo[1]" }
      end

      class Bar < described_class
      end

      class Baz < described_class
        struct { name "baz" }
      end
    end

    let(:foo) { Foo.new nil, {} }
    let(:bar) { Bar.new foo, {} }
    let(:baz) { Baz.new bar, {} }

    it "builds the full path to the current struct" do
      expect(subject).to eq "foo[1].baz"
    end
  end
end
