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

    it "should have coleslaw attribute of type boolean" do
      should have_db_column(:coleslaw).of_type(:boolean)
    end
  end

  let(:test_taco) { Taco.new(meat: 'chicken', rice: false, salsa: true, notes: 'Large size please', coleslaw: false) }

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

  context 'monetize' do
    it 'monetize price attribute' do
      is_expected.to monetize(:price)
    end
  end

  context 'callbacks' do
    it "calculate price before saving" do
      expect(test_taco.price_cents).to eq(0)
      test_taco.save
      expect(test_taco.price_cents).to eq(test_taco.meat_price_cents + test_taco.sides_price_cents)
    end
  end

  context 'sides validation' do
    it "should be valid with at least one side" do
      expect(Taco.new(meat: 'chicken', rice: false, salsa: true, notes: 'Large size please', coleslaw: false)).to be_valid
    end

    it "should be invalid with no sides" do
      expect(Taco.new(meat: 'chicken', rice: false, salsa: false, notes: 'Large size please', coleslaw: false)).to_not be_valid
    end
  end
end
