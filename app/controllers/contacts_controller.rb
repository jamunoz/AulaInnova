class ContactsController < ApplicationController
  
	before_action :set_contact, only: [:index, :new, :create]

  	def index
  	end

  	def new
    	@contact = Contact.new
  	end

  	def create
	    @contact = Contact.new(params[:contact])
	    @contact.request = request

	    respond_to do |format|
		    if @contact.deliver
		      	format.html { 
		      		redirect_to @contact, notice: '¡Muchas gracias! Tu mensaje ha sido enviado satisfactoriamente.'
		      	}
	      	else
	      		format.html { 
	        		redirect_to @contact, alert: 'Lo sentimos. Tu mensaje no ha podido ser enviado.'
	        	}
		    end
		end
  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end

end