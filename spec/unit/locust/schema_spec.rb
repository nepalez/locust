RSpec.describe Locust::Schema do
  let(:parent) { double }
  let(:value)  { { "fooBar" => :BAZ, foo: 1, qux: other } }
  let(:struct) { klass.call(value, parent) }
  let(:other)  { klass.call({}, parent) }
  let(:klass) do
    Class.new(described_class) do
      option :fooBar
      option :qux
    end
  end

  describe ".keyword" do
    before { klass.keyword "foo" }

    it "sets the static keyword with an argument" do
      klass.keyword "baz"
      expect(struct.keyword).to eq "baz"
    end

    it "sets the dynamic keyword with a block" do
      klass.keyword { "foo[#{foo_bar}]" }
      expect(struct.keyword).to eq "foo[BAZ]"
    end
  end

  describe ".call" do
    subject { struct }

    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq value }
    its(:foo_bar) { is_expected.to eq :BAZ }
    its(:qux)     { is_expected.to eq other }

    context "without options" do
      subject { other }

      its(:foo_bar) { is_expected.to be_nil }
      its(:qux)     { is_expected.to be_nil }
    end

    context "with a pre-initialized struct" do
      subject { klass.call other, parent }

      it { is_expected.to eq other }
    end
  end

  describe "#options" do
    context "with unexpected options" do
      subject { struct.options }

      it "returns all options except for parent and source" do
        expect(subject).to eq foo_bar: :BAZ, qux: other
      end
    end
  end

  context "with nested structs" do
    before do
      klass.keyword { "item[#{qux}]" if qux }
    end

    let(:struct)  { klass.call({ qux: 1 }, farther) }
    let(:farther) { klass.call({}, grandpa) }
    let(:grandpa) { klass.call({ qux: 4 }, parent) }

    describe "#parents" do
      subject { struct.parents }

      it "returns a list of struct parents" do
        expect(subject).to eq [grandpa, farther]
      end

      context "when a parent is not a struct" do
        subject { grandpa.parents }
        it { is_expected.to eq [] }
      end
    end

    describe "#full_path" do
      subject { struct.full_path }

      it "returns a list of struct parents" do
        expect(subject).to eq %w[item[4] item[1]]
      end

      context "when a parent is not a struct" do
        subject { grandpa.full_path }
        it { is_expected.to eq %w[item[4]] }
      end
    end
  end

  describe "#validate" do
    subject { struct.validate }

    context "with a class-level validator" do
      let(:validator) { double :validator }

      before do
        allow(validator).to receive_message_chain(:new, :errors) { %w[foo bar] }
        klass.validator(validator)
      end

      it "uses validator to provide errors" do
        expect(validator).to receive(:new).with(struct)
        expect(subject).to eq %w[foo bar]
      end
    end

    context "without a validator" do
      it "returns an empty array" do
        expect(subject).to eq []
      end
    end
  end
end
