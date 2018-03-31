RSpec.describe Locust::Keywords::XmlNamespace::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:uri) { URI source.to_s }
  let(:schema) do
    double :schema, source: source, uri: uri, full_path: "xml.namespace"
  end

  context "with an absolute uri" do
    let(:source) { "https://example.com" }

    it { is_expected.to eq [] }
  end

  context "with a relative uri" do
    let(:source) { "/foo/bar" }

    it { is_expected.not_to be_empty }
  end

  context "with the empty string" do
    let(:source) { "" }

    it { is_expected.not_to be_empty }
  end

  context "with a non-string" do
    let(:source) { 32 }

    it { is_expected.not_to be_empty }
  end
end
