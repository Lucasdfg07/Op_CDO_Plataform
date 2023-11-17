class CreateConcludedLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :concluded_lessons do |t|
      t.belongs_to :user
      t.belongs_to :lesson
      t.timestamps
    end
  end
end
