class CreateTables < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.column :calories, :integer
      t.column :name, :string
    end

    create_table :exercises do |t|
      t.column :calories, :integer
      t.column :exercise_type, :string
    end
  end
end
