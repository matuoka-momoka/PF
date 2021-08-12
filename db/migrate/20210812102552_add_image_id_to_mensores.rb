class AddImageIdToMensores < ActiveRecord::Migration[5.2]
  def change
    add_column :mensores, :image_id, :string
  end
end
