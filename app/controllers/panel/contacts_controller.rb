class Panel::ContactsController  < Panel::ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def model
    Contact
  end

  def index
    @items = Contact.all
  end

  def show
    @item = Contact.find(params[:id])
  end


  def item_params
    params.require(:country).permit!
  end
end
