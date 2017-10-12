class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :photo, index: true
      t.string :commenter
      t.string :body

      t.timestamps
    end
  end
end
