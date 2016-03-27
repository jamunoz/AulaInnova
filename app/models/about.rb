class About < ActiveRecord::Base

	validates :mission, :vision, :company, presence: true
	
end
