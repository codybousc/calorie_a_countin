class ExercisesController < ApplicationController
  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.save
    @exercises = Exercise.all
    @calories_burned = 0
    @exercises.each do |exercise|
      @calories_burned += exercise.calories
    end
    respond_to do |format|
      format.html {redirect_to foods_path}
      format.js
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    @exercises = Exercise.all
    @calories_burned = 0
    @exercises.each do |exercise|
      @calories_burned += exercise.calories
    end
    respond_to do |format|
      format.html {redirect_to foods_path}
      format.js
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:calories, :exercise_type)
  end
end
