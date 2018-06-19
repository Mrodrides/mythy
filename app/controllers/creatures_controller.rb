class CreaturesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_creature, only: [:show, :edit, :update, :delete]
  def index
    # As a user I can see al creatures as a display list
    @creatures = Creature.all
  end

  def show
    # As a user I can look for a specific creature
  end

  def new
    @creature = Creature.new
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
    if params[:search].blank? 
      puts "Enter a name!"
    else  
      @parameter = params[:search] 
      @results = Creature.all.where("Name LIKE :search", search: @parameter)
    end  
  end

  private

  def set_creature
    @creature = Creature.find(params[:id])
  end

  def creature_params
    params.require(:creature).permit(:address, :name, :picture, :price)
  end
end
