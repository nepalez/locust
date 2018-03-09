RSpec.describe Locust::EdgeCases::EmptyString do
  let(:generator) { described_class.new(schema) }
  let(:schema)    { { "title" => "phone", "type" => "string" } }

  describe "#applicable?" do
    subject { generator.applicable? }

    context "with the string type" do
      it { is_expected.to eq true }
    end

    context "with a non-string type" do
      before { schema["type"] = "number" }
      it { is_expected.to eq false }
    end

    context "with a zero minLength" do
      before { schema["minLength"] = 0 }
      it { is_expected.to eq true  }
    end

    context "with a positive minLength" do
      before { schema["minLength"] = 1 }
      it { is_expected.to eq false  }
    end

    context "with a const" do
      before { schema["const"] = "" }
      it { is_expected.to eq false  }
    end

    context "with a enum" do
      before { schema["enum"] = ["", "foo"] }
      it { is_expected.to eq false  }
    end

    context "with a pattern rejecting empty strings" do
      before { schema["pattern"] = ".+" }
      it { is_expected.to eq false  }
    end

    context "with a pattern accepting empty strings" do
      before { schema["pattern"] = ".*" }
      it { is_expected.to eq true  }
    end

    context "with the password format" do
      before { schema["format"] = "password" }
      it { is_expected.to eq true  }
    end

    context "with the date format" do
      before { schema["format"] = "date" }
      it { is_expected.to eq false  }
    end

    context "with the dateTime format" do
      before { schema["format"] = "dateTime" }
      it { is_expected.to eq false  }
    end

    context "with the byte format" do
      before { schema["format"] = "byte" }
      it { is_expected.to eq false  }
    end

    context "with the email format" do
      before { schema["format"] = "email" }
      it { is_expected.to eq false  }
    end

    context "with the uuid format" do
      before { schema["format"] = "uuid" }
      it { is_expected.to eq false  }
    end

    context "with the custom format without other restrictions" do
      before { schema["format"] = "foo" }
      it { is_expected.to eq false  }
    end

    context "with a custom format and a pattern" do
      before { schema.update "pattern" => ".*", "format" => "cat" }
      it { is_expected.to eq true  }
    end

    context "with a custom format and a minLength" do
      before { schema.update "pattern" => ".*", "minLength" => 0 }
      it { is_expected.to eq true  }
    end
  end

  describe "#call" do
    subject { generator.call }

    it { is_expected.to eq "" }
  end
end
