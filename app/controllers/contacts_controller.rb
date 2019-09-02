class ContactsController < ActionController::Base
  layout "landing_cocoa"
  protect_from_forgery with: :exception
  before_action :places

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
      ContactMailer.contact_email(@contact.id).deliver
      redirect_to new_contact_path, notice: "Message sent successfully..."
    else
      redirect_to new_contact_path, alert: "An error occurred..."
    end
  end

  def places
    @places = Place.all
  end

  private

  def contact_params
    params.require(:contact).permit!
  end

end
