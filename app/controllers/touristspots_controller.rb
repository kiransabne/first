class TouristspotsController < ApplicationController
  before_action :set_touristspot, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:search, :index, :show]

  def search
    if params[:search].present?
      @touristspots = Touristspot.search(params[:search])
    else
      @touristspots = Touristspot.all
    end
  end

  # GET /touristspots
  # GET /touristspots.json
  def index
    @touristspots = Touristspot.all
  end

  # GET /touristspots/1
  # GET /touristspots/1.json
  def show
	@touristspot = Touristspot.find(params[:id])
	@reviews = @touristspot.reviews
	if @reviews.blank?
        @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  # GET /touristspots/new
  def new
    @touristspot = Touristspot.new
  end

  # GET /touristspots/1/edit
  def edit
  end

  # POST /touristspots
  # POST /touristspots.json
  def create
    @touristspot = Touristspot.new(touristspot_params)

    respond_to do |format|
      if @touristspot.save
        format.html { redirect_to @touristspot, notice: 'Touristspot was successfully created.' }
        format.json { render :show, status: :created, location: @touristspot }
      else
        format.html { render :new }
        format.json { render json: @touristspot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /touristspots/1
  # PATCH/PUT /touristspots/1.json
  def update
    respond_to do |format|
      if @touristspot.update(touristspot_params)
        format.html { redirect_to @touristspot, notice: 'Touristspot was successfully updated.' }
        format.json { render :show, status: :ok, location: @touristspot }
      else
        format.html { render :edit }
        format.json { render json: @touristspot.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def upvote
    @touristspot.upvote_by current_user
    redirect_to @touristspot
    end
    
  def downvote
    @touristspot.downvote_by current_user
    redirect_to @touristspot
    end

  # DELETE /touristspots/1
  # DELETE /touristspots/1.json
  def destroy
    @touristspot.destroy
    respond_to do |format|
      format.html { redirect_to touristspots_url, notice: 'Touristspot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_touristspot
      @touristspot = Touristspot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def touristspot_params
      params.require(:touristspot).permit(:name, :location, :shortinfo, :description, :tourist)
    end
end
