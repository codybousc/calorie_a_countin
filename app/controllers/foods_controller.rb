class FoodsController < ApplicationController
  def index
    @exercises = Exercise.all
    @foods = Food.all
    @food = Food.new
    @calorie_total = 0
    @foods.each do |food|
      @calorie_total += food.calories
    end
    @calories_burned = 0
    @exercises.each do |exercise|
      @calories_burned += exercise.calories
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.save
    @foods = Food.all
    @calorie_total = 0
    @foods.each do |food|
      @calorie_total += food.calories
    end
    respond_to do |format|
      format.html {redirect_to foods_path}
      format.js
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    @foods = Food.all
    @calorie_total = 0
    @foods.each do |food|
      @calorie_total += food.calories
    end
    respond_to do |format|
      format.html {redirect_to foods_path}
      format.js 
    end
  end

  private
    def food_params
      params.require(:food).permit(:calories, :name)
    end
  end
