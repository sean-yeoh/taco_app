require 'rails_helper'

RSpec.describe Taco, type: :model do
  context "attributes" do
    it "should have meat attribute of type string" do
      should have_db_column(:meat).of_type(:string)
    end

    it "should have rice attribute of type boolean" do
      should have_db_column(:rice).of_type(:boolean)
    end

    it "should have salsa attribute of type string" do
      should have_db_column(:salsa).of_type(:boolean)
    end

    it "should have notes attribute of type text" do
      should have_db_column(:notes).of_type(:text)
    end
  end

  let(:test_taco) { Taco.new(meat: 'chicken', rice: false, salsa: true, notes: 'Large size please') }

  context "can be saved to database" do
    it "is valid" do
      expect(test_taco).to be_valid
    end

    it "increase taco db count by 1" do
      taco_db_count = Taco.count
      test_taco.save
      expect(Taco.count).to eq(taco_db_count + 1)
    end
  end

  describe '#notes' do
    it { is_expected.to validate_presence_of(:notes) }
  end
end
