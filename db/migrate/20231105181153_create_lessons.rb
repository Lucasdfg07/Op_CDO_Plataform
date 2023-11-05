class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.belongs_to :lesson_class
      t.string :title
      t.timestamps
    end
  end
end
