class DropActiveStorage < ActiveRecord::Migration[5.2]
  def up
    drop_table :active_storage_blobs
    drop_table :active_storage_attachments
  end
end
