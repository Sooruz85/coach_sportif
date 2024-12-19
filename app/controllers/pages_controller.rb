class PagesController < ApplicationController
  # Page d'accueil
  def home
  end

  # Pages d'information
  def services
  end

  def about
  end

  def gallery
  end

  # Contact
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

  # Services spécifiques
  def coaching
    @service_name = "Coaching personnalisé"
    @service_description = "Un programme adapté à vos besoins et objectifs pour des résultats maximaux."
  end

  def group_training
    # Ici vous pouvez définir des variables d'instance si nécessaire
    @service_name = "Entraînements en Groupe"
    @service_description = "Des séances collectives pour travailler en équipe et vous motiver ensemble."
  end

  def specific_physical_preparation
  end

  # Réservations
  def reservation
    @reservation = Reservation.new # Crée une nouvelle instance pour le formulaire
  end

  def create_reservation
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      # Rediriger vers la page de confirmation ou accueil après enregistrement réussi
      redirect_to home_path, notice: 'Votre réservation a été effectuée avec succès !'
    else
      # Si l'enregistrement échoue, afficher à nouveau le formulaire avec les erreurs
      render :reservation
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :email, :date, :time, :message)
  end
end
