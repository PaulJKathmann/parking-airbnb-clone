class SpacesController < ApplicationController
  #for more info about this go to application_controller or sources from yesterday!
  #if a method is written here you DO NOT NEED TO LOG IN to call it!
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
<<<<<<< HEAD
    @spaces = policy_scope(Space).order(created_at: :desc)
=======
    # @spaces = policy_scope(Space).order(created_at: :desc)
    @spaces = policy_scope(Space).where.not(latitude: nil, longitude: nil)
>>>>>>> 37c9cef52307f0e6db4d9cb720f8f737004510b3

    @markers = @spaces.map do |space|
      {
        lat: space.latitude,
<<<<<<< HEAD
        lng: space.longitude
      }
=======
        lng: space.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { space: space })
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
>>>>>>> 37c9cef52307f0e6db4d9cb720f8f737004510b3
  end

  def show
    @space = Space.find(params[:id])
    authorize @space
  end


  def new
    @space = Space.new
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    authorize @space
    if @space.save
      redirect_to spaces_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def space_params
    params.require(:space).permit(:address, :start_date, :end_date, :price, :size, :photo, :photo_cache)
  end
end
