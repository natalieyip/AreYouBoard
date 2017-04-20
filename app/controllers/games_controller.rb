class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    render '/index.html.haml'
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @tags = GameTag.where(game: @game)
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    tag_params = game_params[:tags]
    tags = tag_params.split(',')
    new_game_params = game_params.except(:tags)
    @game = Game.new(new_game_params)

    respond_to do |format|
      if @game.save
        tags.each do |tag|
          Tag.create(name: tag)
          found_tag = Tag.find_by(name: tag)
          GameTag.create(game: @game, tag: found_tag)
        end
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.fetch(:game).permit(:title, :players, :age, :play_time, :complexity, :publisher, :img_url, :description, :tags)
    end

end
