class CreaturesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  before_action :set_creature, only: [:show, :edit, :update, :delete]
  def index
    # As a user I can see al creatures as a display list
    @creatures = Creature.all
  end

  def show
    # As a user I can look for a specific creature
  end

  def new
    # @creature = Creature.new
  end

  def create
    # As a user I can put a creature to be booked
    @creature = Creature.new(creature_params)
    @creature.user_id = current_user.id
    if @creature.save
      redirect_to creature_path(@creature)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def search
    # Action when you perform a search
    if params[:search].empty?
      redirect_to(root_path, alert: "Enter an address!")
    else
      @coordinates = Geocoder.search("#{params[:search]}").first.coordinates
      @results = Creature.near(@coordinates).limit(25)
      @markers = @results.map do |creature|
      {
        lat: creature.lat,
        lng: creature.long
      }
      end
    end
  end

  private

  def set_creature
    @creature = Creature.find(params[:id])
  end

  def creature_params
    params.require(:creature).permit(:name, :address, :picture, :price, :description, :care, :diet, :wifi, :fly, :mount, :dangerous, :shitty, :domestic)
  end
end
