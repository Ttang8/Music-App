class BandsController < ApplicationController
  before_action :require_logged_in

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = ["Couldnt create band for some reason"]
      redirect_to bands_url
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = selected_band
    render :edit
  end

  def show
    @band = selected_band
    render :show
  end

  def update
    @band = selected_band
    if @band.update_attributes(band_params)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Failed to update band"]
      redirect_to edit_band_url
    end
  end

  def destroy
    @band = selected_band
    if @band
      @band.destroy
      redirect_to bands_url
    else
      flash.now[:errors] = ["Could not remove band"]
      redirect_to bands_url
    end
  end

  private

  def selected_band
    Band.find_by(id: params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
