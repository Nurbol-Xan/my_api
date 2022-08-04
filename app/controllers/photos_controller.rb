class PhotosController < ApplicationController
  before_action :authorize
  before_action :set_photo, only: %i[ show update destroy ]

  # GET /photos
  def index
    @photos = Photo.all

    render json: @photos[0..19]
  end

  # GET /photos/1
  def show
    render json: @photo
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      render json: {message: "Photo updated successfully"}
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
    if @photo.destroy
      render json: {message: "Photo deleted successfully"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:albumId, :title, :url, :thumbnailUrl)
    end
end
