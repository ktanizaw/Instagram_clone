class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy ]

  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    if params[:back]
      render :new
    else
    @picture = current_user.pictures.build(picture_params)
      if @picture.save
        redirect_to pictures_path, notice: "投稿しました！"
      else
        render 'new'
      end
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    render :new if @picture.invalid?
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: '更新しました！' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: '削除しました！' }
    end
  end

  private

  def set_picture
  @picture = Picture.find(params[:id])
  end

  def picture_params
  params.require(:picture).permit(:image, :title, :image_cache)
  end

  def login_required
    redirect_to new_session_path unless current_user
  end

end
