class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_game, only: [:show]

  def index
    @games = Game.all.order('created_at DESC')
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  private

  def game_params
    params.require(:game).permit(:image, :title, :explain, :price)
  end

  def set_game
    @game = Game.find(params[:id])
  end

end
