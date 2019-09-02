class Panel::PagesController  < Panel::ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def model
    Page
  end

  def index
    @items = model.where(conditions)
    add_breadcrumb model.model_name.human(count: :many), index_url
  end

  def item_params
    params.require(:page).permit!
  end
end
