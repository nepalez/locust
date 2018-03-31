RSpec.describe Locust::Validators::Not, ".call" do
  subject { described_class.call(schema) }

  let(:parent) { double type: parent_type }
  let(:schema) { double :schema, parent: parent, full_path: "foo.not" }
end
