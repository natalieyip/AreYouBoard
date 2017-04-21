class TagsController < ApplicationController


  def show
    @tag = Tag.find(params[:id])
    @gametags = @tag.game_tags
    @games = []
    @gametags.each do |gametag|
      @games << gametag.game
    end
    render "index"
  end


  private

  def tag_params
    params.require(:tag).permit(:tag)
  end

  def game_params
      params.fetch(:game).permit(:title, :players, :age, :play_time, :complexity, :publisher, :img_url, :description)
    end
end
