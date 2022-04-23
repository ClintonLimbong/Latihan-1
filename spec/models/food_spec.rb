require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'has a valid factory for food' do
    expect(FactoryBot.build(:food)).to be_valid
  end

  it 'has valid a different factory for food' do
    food1 = FactoryBot.create(:food, name: "Ayam Gulai")
    food2 = FactoryBot.create(:food, name: "Ayam Kecap")
    expect(FactoryBot.build(:food)).to be_valid
  end

  describe 'self#by_letter' do
    context 'with matching letter' do
      it "should return a sorted array of results that match" do
        food1 = FactoryBot.create(:food, name: 'Nasi Rendang')
        food2 = FactoryBot.create(:food, name: 'Nasi Ayam Gulai')
        food3 = FactoryBot.create(:food, name: 'Nasi Ayam Rendang')
  
        expect(Food.by_letter("N")).to eq([food2, food3, food1])
      end
    end
  end
end
