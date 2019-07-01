class TalksController < ApplicationController
  before_action :set_talk, only: [:edit,:update,:destroy]

  def top
  end

  def index
    @talks = Talk.where(folder_id: params[:folder_id]).order("created_at DESC")
    @folders = Folder.all.order('id DESC')
    #form_forで使う変数↓
    @talk = Talk.new 
    @folder = Folder.find(params[:folder_id])
  end

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
     redirect_to "/folders/#{params[:folder_id]}/talks"
    else
      redirect_to "/folders/#{params[:folder_id]}/talks"
      flash[:alert] = "テキストが空です"
    end
  end

  def edit
    @folder = Folder.find(params[:folder_id])
  end

  def update
    @talk.update(talk_params)
    redirect_to "/folders/#{params[:folder_id]}/talks"
  end

  def  destroy
    @talk.destroy
    redirect_to folder_talks_path(params[:folder_id])
  end

  def search
    @folders = Folder.all
    @talks = Talk.where("text LIKE(?)", "%#{params[:keyword]}%") unless params[:keyword] == ""
    @word = params[:keyword]
  end


  private
  def talk_params
    params.require(:talk).permit(:text).merge(folder_id: params[:folder_id])
  end

  def set_talk
    @talk = Talk.find(params[:id])
  end
end
