class Panel::FlavorsController  < Panel::ApplicationController
  before_action :set_flavor, only: [:edit, :update, :show, :create_flavor_item, :destroy, :change_status]
  before_action :set_flavor_item, only: [:destroy_flavor_item]
  
  def index
    @flavors = Flavor.all
  end

  def new
    @flavor = Flavor.new
    @order = 0
    if Flavor.all.size > 0
      @order = Flavor.all.size
    end
  end

  def create
    @flavor = Flavor.new(flavor_params)
    if @flavor.save
      redirect_to panel_flavors_path, notice: "Created successfully..."
    else
      render :new
      flash[:alert] = "An error ocurred..."
    end
  end

  def edit
    @order = @flavor.order
  end

  def update
    if @flavor.update(flavor_params)
      redirect_to panel_flavors_path, notice: "Update successfully..."
    else
      redirect_to panel_flavors_path, alert: "An error ocurred..."
    end
  end

  def show
    @flavor_item = @flavor.flavor_items.new
    @order = 0
    if @flavor.flavor_items.size > 0
      @order = @flavor.flavor_items.size
    end
  end

  def change_status
    if @flavor.is_visible == true
      @flavor.is_visible = false
    else
      @flavor.is_visible = true
    end
    @flavor.save
    redirect_to panel_flavors_path, notice: "Status change successfully..."
  end

  def create_flavor_item
    @flavor_item = @flavor.flavor_items.new(flavor_item_params)
    if @flavor_item.save
      redirect_to panel_flavor_path(@flavor), notice: "Created successfully..."
    else
      redirect_to panel_flavor_path(@flavor), alert: "An error ocurred..."
    end
  end

  def destroy_flavor_item
    flavor = @flavor_item.flavor_id
    if @flavor_item.destroy
      redirect_to panel_flavor_path(flavor), notice: "Destroy successfully..."
    else
      redirect_to panel_flavor_path(flavor), alert: "An error ocurred..."
    end
  end

  def destroy
    if @flavor.destroy
      redirect_to panel_flavors_path, notice: "Destroy successfully..."
    else
      redirect_to panel_flavors_path, alert: "An error ocurred..."
    end
  end

  private

    def set_flavor
      @flavor = Flavor.find(params[:id])
    end

    def set_flavor_item
      @flavor_item = FlavorItem.find(params[:id])
    end

    def flavor_params
      params.require(:flavor).permit!
    end

    def flavor_item_params
      params.require(:flavor_item).permit!
    end
end
