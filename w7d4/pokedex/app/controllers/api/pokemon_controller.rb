class Api::PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
