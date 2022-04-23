class FoodsController < ApplicationController  
  def index
    @foods = Food.by_letter(params[:letter])
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @foods = Food.new
  end

  def edit
  end
end
