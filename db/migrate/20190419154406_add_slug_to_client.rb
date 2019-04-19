class AddSlugToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :slug, :string
  end
end
