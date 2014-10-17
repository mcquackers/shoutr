class CreateReshoutSubjects < ActiveRecord::Migration
  def change
    create_table :reshout_subjects do |t|
      t.integer :shout_id
      t.integer :user_id

      t.timestamps
    end
  end
end
