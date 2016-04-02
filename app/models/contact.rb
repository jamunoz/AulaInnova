class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Alguien se ha contactado con AulaInnova!",
      :to => "contacto@aulainnova.cl",
      :from => %("#{name}" <#{email}>)
    }
  end
end