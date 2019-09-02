module Componentable
  extend ActiveSupport::Concern

  included do
    respond_to :html, :json

    before_filter :init_breadcrumb

    helper_method :index_url
    helper_method :item_url
    helper_method :model
    helper_method :namespace
  end

  def init_breadcrumb
    add_breadcrumb I18n.t('layouts.admin.breadcrumb.home'), root_url
  end

  def conditions(conditions = {})
    conditions
  end


  def model
    raise NoTypeGivenError
  end

  def index_url
    url_for action: :index
  end

  def item_url(id)
    url_for action: :show, id: id
  end

  def show
    prepare_data
    @item = model.friendly.active.find(params[:id])
    add_breadcrumb @item.title, page_url(@item)
  end

  def prepare_data
  
  end

end
