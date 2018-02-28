RSpec.describe Locust do
  let(:builder) { described_class.new }
  let(:block)   { proc { |c| c.format(:foo) { |f| f.generator { :FOO } } } }

  describe "#config" do
    subject { builder.config }

    it { is_expected.to be_kind_of Locust::Config }
  end

  describe "#configure" do
    subject { builder.configure(&block) }

    it "configures the examples builder" do
      expect { subject }
        .to change { builder.config.formats["foo"].generators.map(&:call) }
        .to [:FOO]
    end

    it "protects inernal data by returning itself" do
      expect(subject).to eq builder
    end
  end

  describe ".configure" do
    subject { described_class.configure(&block) }

    it "constructs and configures the builder" do
      expect(described_class).to receive_message_chain(:new, :configure)
      subject
    end
  end
end
