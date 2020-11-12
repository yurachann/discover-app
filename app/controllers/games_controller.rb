class GamesController < ApplicationController
  def index
  end

  def new
    @game = Game.new
  end

  def create
    binding.pry
    @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:image, :title, :explain, :price)
  end

end
