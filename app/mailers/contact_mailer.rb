class ContactMailer < ApplicationMailer
  def contact_email(name, email, message)
    @name = name
    @message = message
    @contact_email = email # Correction ici

    mail(
      to: 'votre_email@example.com',
      from: @contact_email, # Utilisation de la variable d'instance
      subject: 'Nouveau message de contact'
    )
  end
end
