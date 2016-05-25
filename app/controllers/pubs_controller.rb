class PubsController < ApplicationController
  before_action :set_pub, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:search, :index, :show]

  def search
   if params[:search].present?
    @pubs = Pub.search(params[:search])
   else
    @pubs = Pub.all
   end
  end
 
  # GET /pubs
  # GET /pubs.json
  def index
    @pubs = Pub.all
  end

  # GET /pubs/1
  # GET /pubs/1.json
  def show
	@pub = Pub.find(params[:id])
	@reviews = @pub.reviews
    if @reviews.blank?
        @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  # GET /pubs/new
  def new
    @pub = Pub.new
  end

  # GET /pubs/1/edit
  def edit
  end

  # POST /pubs
  # POST /pubs.json
  def create
    @pub = Pub.new(pub_params)

    respond_to do |format|
      if @pub.save
        format.html { redirect_to @pub, notice: 'Pub was successfully created.' }
        format.json { render :show, status: :created, location: @pub }
      else
        format.html { render :new }
        format.json { render json: @pub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pubs/1
  # PATCH/PUT /pubs/1.json
  def update
    respond_to do |format|
      if @pub.update(pub_params)
        format.html { redirect_to @pub, notice: 'Pub was successfully updated.' }
        format.json { render :show, status: :ok, location: @pub }
      else
        format.html { render :edit }
        format.json { render json: @pub.errors, status: :unprocessable_entity }
      end
    end
  end

	def upvote
		@pub.upvote_by current_user
		redirect_to @pub
	end
		
	def downvote
		@pub.downvote_by current_user
		redirect_to @pub
	end

  # DELETE /pubs/1
  # DELETE /pubs/1.json
  def destroy
    @pub.destroy
    respond_to do |format|
      format.html { redirect_to pubs_url, notice: 'Pub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pub
      @pub = Pub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pub_params
      params.require(:pub).permit(:name, :address, :zipcode, :phone, :timing, :takesreservation, :parking, :goodforgroups, :ambience, :noiselevel, :goodfordancing, :alcoho, :happyhour, :smoking, :hastv, :bar, :pubhome)
    end
end
