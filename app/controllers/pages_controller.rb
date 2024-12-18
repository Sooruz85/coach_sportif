class PagesController < ApplicationController
  def home
  end

  def services
  end

  def about
  end

  def gallery
  end

  def contact
  end

  def submit_contact
    @name = params[:name]
    @message = params[:message]
    @contact_email = params[:email]

    if @name.present? && @message.present? && @contact_email.present? && @contact_email.match?(URI::MailTo::EMAIL_REGEXP)
      # Envoyer un email
      ContactMailer.contact_email(@name, @contact_email, @message).deliver_now

      flash[:notice] = "Merci, #{@name} ! Votre message a été envoyé."
      redirect_to contact_path
    else
      flash[:alert] = "Veuillez remplir tous les champs et entrer une adresse email valide."
      redirect_to contact_path
    end
  end

  def coaching
  end

  def group_training
  end

  def specific_physical_preparation
  end
end
