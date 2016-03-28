class About < ActiveRecord::Base
	
	has_paper_trail
	
	validates :mission, :vision, :company, presence: true
	
end
