class AddImageDataToSlide < ActiveRecord::Migration[5.2]
  def change
    add_column :slides, :image_data, :text
  end
end
