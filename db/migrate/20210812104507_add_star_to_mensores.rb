class AddStarToMensores < ActiveRecord::Migration[5.2]
  def change
    add_column :mensores, :star, :float
  end
end
