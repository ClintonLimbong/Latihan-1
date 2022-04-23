require 'rails_helper'

RSpec.describe FoodsController do
  describe 'GET #show' do
    it 'assign the requested food to the food' do
      food = FactoryBot.create(:food)
      get :show, params: { id: food}
      expect(assigns(:food)).to eq food
    end
  end

  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of foods starting with the letter" do
        food1 = FactoryBot.create(:food, name: "Nasi Rendang")
        food2 = FactoryBot.create(:food, name: "Nasi Ayam Gulai")
        food3 = FactoryBot.create(:food, name: "Nasi Ayam Rendang")

        get :index, params: {letter: 'N'}
        expect(assigns(:foods)).to match_array([food2, food3, food1])
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all foods" do
        food1 = FactoryBot.create(:food, name: "Nasi Rendang")
        food2 = FactoryBot.create(:food, name: "Nasi Ayam Gulai")
        food3 = FactoryBot.create(:food, name: "Nasi Ayam Rendang")

        get :index
        expect(assigns(:foods)).to match_array([food2, food3, food1])
      end
    end
  end

  describe 'GET #new' do
    it "assigns a new Food to @food" do
      get :new
      expect(assigns(:food)).to be_a_new(Food)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end
end