class RenameSlideImageToLegacyImage < ActiveRecord::Migration[5.2]
  def change
    change_table :slides do |t|
      t.rename :image, :legacy_image
    end
  end
end
