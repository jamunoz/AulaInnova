class AddAttachmentAssetToAlbums < ActiveRecord::Migration
  def self.up
    change_table :albums do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :albums, :asset
  end
end
