class CreateLessonClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :lesson_classes do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
