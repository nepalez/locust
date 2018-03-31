RSpec.describe Locust::Keywords::Xml::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "foo.xml" }
end
