class AlbumsController < ApplicationController
  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = ['Fields entered incorrectly']
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    redirect_to bands_url
  end

  def new
    if params.has_key?(:band_id)
      @album = Album.new(band_id: params[:band_id])
    else
      @album = Album.new
    end
  
    render :new
  end

  def create
    @album = Album.new(album_params)
    
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = ['Fields entered incorrectly']
      redirect_to bands_url
    end
  end

  private
  
  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live_album)
  end
end
