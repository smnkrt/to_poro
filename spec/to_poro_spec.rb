require "spec_helper"

RSpec.describe ToPoro do
  class DummyClass
    extend ToPoro

    def self.pluck(*_args)
      [[1, "Abc"]]
    end
  end

  describe "#to_poro" do
    subject { DummyClass.to_poro(:id, :text) }

    it "returns requested data as an Array of Structs" do
      expect(subject).to be_a(Array)
      expect(subject.first).to be_a(Struct)
      expect(subject.first.id).to eq(1)
      expect(subject.first.text).to eq('Abc')
    end
  end
end
