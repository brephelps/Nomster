class AlterPhotosAddIndexPlaces < ActiveRecord::Migration[5.2]
  def change
    add_index :photos, :place_id
  end
end
