class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :lesson
      t.string :description
      t.timestamps
    end
  end
end
