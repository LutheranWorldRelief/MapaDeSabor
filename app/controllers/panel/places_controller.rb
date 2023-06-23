class Panel::PlacesController  < Panel::ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :set_place, only: [:update]

  def model
    Place
  end

  def index
    @items = model.where(conditions)
    add_breadcrumb model.model_name.human(count: :many), index_url
  end

  def update
    if @place.update(item_params)
      @place.quality_flavors = @place.quality_flavors.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')
      @place.content_right = @place.content_right.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')
      @place.harvest = @place.harvest.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')
      @place.content_left = @place.content_left.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')
      @place.scheme = @place.scheme.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')
      
      @place.quality_flavors_eng = @place.quality_flavors_eng.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')
      @place.content_right_eng = @place.content_right_eng.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')
      @place.harvest_eng = @place.harvest_eng.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')
      @place.content_left_eng = @place.content_left_eng.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')
      @place.scheme_eng = @place.scheme_eng.gsub('src="/ckeditor_assets/pictures/','src="https://cocoaflavormap2.cacaomovil.com/ckeditor_assets/pictures/')

      @place.save
      redirect_to "/panel/places/#{@place.id}/edit", notice: "Actualizado correctamente"
    else
      redirect_to "/panel/places/#{@place.id}/edit", notice: "Ocurrio un error"
    end
  end

  def item_params
    params.require(:place).permit!
  end

  private

    def set_place
      @place = Place.find(params[:id])
    end
end