class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @game_form = GameForm.new
  end

  def create
    @game_form = GameForm.new(game_params)
    if @game_form.valid?
      @game_form.save
      redirect_to root_path
    else
      render action: :new
    end
  end
  
  private
  
  def game_params
    params.require(:game_form).permit(:image, :title, :explain, :price, genre_ids: [], console_ids: [])
  end

  def genre_params(game)
    params.permit(genre_ids: [])
  end

  def console_params(game)
    params.permit(console_ids: [])
  end
  
end
