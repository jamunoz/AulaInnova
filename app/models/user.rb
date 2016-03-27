class User < ActiveRecord::Base
 	
	validates :email, :password, :password_confirmation, :roles_mask, presence: true
	validates :password, :password_confirmation, length: { in: 8..20 }
	validates :roles_mask, numericality: { only_integer: true }

  	# Include default devise modules. Others available are:
  	# :lockable, :timeoutable and :omniauthable
  	devise 	:database_authenticatable, :registerable,
         	:recoverable, :rememberable, :trackable, :validatable,
         	:confirmable

    ROLES = %i[administrador miembro]

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
