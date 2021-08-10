class CreateMensoreComments < ActiveRecord::Migration[5.2]
  def change
    create_table :mensore_comments do |t|
      t.integer :user_id
      t.integer :mensore_id
      t.text :comment

      t.timestamps
    end
  end
end
