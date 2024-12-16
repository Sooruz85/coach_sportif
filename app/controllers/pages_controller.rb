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
    # Exemple de gestion des paramètres envoyés
    @name = params[:name]
    @message = params[:message]
    flash[:notice] = "Thank you, #{@name}! Your message has been received."
    redirect_to contact_path
  end

  def coaching
  end

  def group_training
  end

  def specific_physical_preparation
  end
end
