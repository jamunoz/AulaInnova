RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete do
      except ['About']
    end
    show_in_app
    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  config.model About do
    label "Acerca de Nosotros" 
    edit do
      # For RailsAdmin >= 0.5.0
      field :mission, :ck_editor
      field :vision, :ck_editor
      field :company, :ck_editor

      # field :mission do
      #   label "Misión"
      # end
      #   field :vision do
      #   label "Visión"
      # end
      # field :company do
      #   label "Compañía"
      # end

    end
  end

  config.model User do
    edit do

      field :email do
        required true 
        #label "Correo Electrónico"
        help 'Requerido. Longitud de hasta 255.'
      end
        field :password do
        required true 
        #label "Contraseña"
        help 'Requerido. Longitud entre 8 y 20.'
      end

      field :password_confirmation do
        required true 
        #label "Confirmar Contraseña"
        help 'Requerido.'
      end

      field :roles_mask do
        label "Rol"
        help 'Opcional.'
      end

      exclude_fields :reset_password_sent_at
      exclude_fields :remember_created_at
      exclude_fields :sign_in_count
      exclude_fields :current_sign_in_at
      exclude_fields :last_sign_in_at
      exclude_fields :current_sign_in_ip
      exclude_fields :last_sign_in_ip
      exclude_fields :confirmation_token
      exclude_fields :confirmed_at
      exclude_fields :confirmation_sent_at
      exclude_fields :unconfirmed_email  
    end
  end

  config.model Post do
    edit do

      configure :user do
        visible false
      end

      field :asset do
        label "Imagen"
      end

      field :title do
        label "Título"
        required true 
      end

      field :lead do
        label "Copete"
        required true 
      end

      field :body, :ck_editor do
        required true 
        label "Cuerpo"
      end

      field :user_id, :hidden do
        visible true
        default_value do
          bindings[:view]._current_user.id
        end
      end

    end
  end

end
