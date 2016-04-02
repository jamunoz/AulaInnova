class Post < ActiveRecord::Base
  	
  	has_paper_trail

	belongs_to :user

	has_attached_file :asset,
	    :styles => {
	      :thumb => "100x100#",
	      :small  => "150x150>",
	      :medium => "200x200>", 
	      :large => "500x500>",
	      :extense =>"600x500>"
	    }
	      
	validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
	# add a delete_<asset_name> method: 
	attr_accessor :delete_asset
	before_validation { self.asset.clear if self.delete_asset == '1' }

	self.per_page = 5

	def self.search(search)
		if search
			where("title like ?", "%#{search}%")
		else
			all
		end
	end
	
end
