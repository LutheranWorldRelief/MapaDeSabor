class ProductsController < ActionController::Base
  layout 'application'
  protect_from_forgery with: :exception

  def show
    @places = Place.all
    @item = Place.friendly.find(params[:id]) rescue nil
    redirect_to root_url if @item.blank?
  end

end
