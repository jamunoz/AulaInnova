class AddAttachmentAssetToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :posts, :asset
  end
end
