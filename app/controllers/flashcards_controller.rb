class FlashcardsController < ApplicationController
  before_action :set_flashcard , only: [:edit , :update ,:destroy]

  def index
    @flashcards = Flashcard.order("RAND()")
  end

  def new
    @flashcard = Flashcard.new
  end

  def create
    @flashcard = Flashcard.new(flash_params)
    if @flashcard.save
      redirect_to "/flashcards"
    else
      redirect_to "/flashcards/new"
      flash[:alert] = "保存できませんでした"
    end
  end

  def edit
  end

  def update
    @flashcard.update(flash_params)
    redirect_to "/flashcards"
  end

  def destroy
    @flashcard.destroy
    redirect_to "/flashcards"
  end

  private
  def flash_params
    params.require(:flashcard).permit(:word, :answer)
  end

  def set_flashcard
    @flashcard = Flashcard.find(params[:id])
  end
end
