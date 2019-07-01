class FoldersController < ApplicationController
  before_action :set_folder, only: [:edit,:update,:destroy]
  before_action :authenticate_user!

  def index
    @folder = Folder.all.order('id DESC')
    # binding.pry
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    if @folder.save
      redirect_to "/folders"
    else
      redirect_to "/folders/new"
      flash[:alert] = "保存できませんでした"
    end
  end

  def edit
  end

  def update
    @folder.update(folder_params)
    redirect_to "/folders"
  end

  def destroy
    @folder.destroy
    redirect_to "/folders"
    # binding.pry
  end

  def search
    @folders = Folder.where("name LIKE(?)", "%#{params[:keyword]}%") unless params[:keyword] == ""
    @word = params[:keyword]
  end



 private
  def folder_params
    params.require(:folder).permit(:name)
  end

  def set_folder
    @folder = Folder.find(params[:id])
  end
end


