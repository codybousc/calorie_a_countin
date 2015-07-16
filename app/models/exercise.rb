class Exercise < ActiveRecord::Base
  validates_presence_of :exercise_type, :calories
end
