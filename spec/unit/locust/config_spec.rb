RSpec.describe Locust::Config do
  let(:config) { described_class.new }

  describe "#formats" do
    subject { config.formats }

    it { is_expected.to be_a Hash }

    let(:format) { subject["foo"] }

    it "contains empty format by default" do
      expect(format).to be_a Locust::Config::Format
      expect(format.generators.count).to be_zero
    end
  end

  describe "#format" do
    subject do
      config.format("bar") { |f| f.generator { :BAR } }
      config.format("bar") { |f| f.generator(immutable: true) { :BAZ } }
      config.format("qux") { |f| f.generator { :QUX } }
    end

    before { subject }
    let(:formats) { config.formats }

    it "registers formats with generators" do
      expect(formats["qux"].generators.map(&:call)).to eq [:QUX]
    end

    it "keeps a previous config as well" do
      expect(formats["bar"].generators.map(&:call))
        .to contain_exactly :BAR, :BAZ
    end

    it "applies the 'immutable: true' option" do
      expect(formats["bar"].generators.mutable.map(&:call)).to eq [:BAR]
    end

    it "protects internal data by returning itself" do
      expect(subject).to eq config
    end

    context "without a block" do
      subject { config.format "bar" }

      it "returns itself" do
        expect(subject).to eq config
      end
    end
  end
end
