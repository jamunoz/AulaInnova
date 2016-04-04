class User < ActiveRecord::Base
 	
	has_paper_trail

  	# Include default devise modules. Others available are:
  	# :lockable, :timeoutable and :omniauthable, :confirmable, :registerable
  	devise 	:database_authenticatable, 
         	:recoverable, :rememberable, :trackable, :validatable     

    ROLES = %i[administrador]

    def roles=(roles)
		roles = [*roles].map { |r| r.to_sym }
	  	self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
	end

	def roles
	  	ROLES.reject do |r|
	    	((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
	  	end
	end

	def has_role?(role)
  		roles.include?(role)
	end

end
