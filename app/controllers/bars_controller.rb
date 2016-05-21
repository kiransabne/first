class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:search, :index, :show]

  def search
    if params[:search].present?
      @bars = Bar.search(params[:search])
    else
      @bars = Bar.all
    end
  end


  # GET /bars
  # GET /bars.json
  def index
    @bars = Bar.all
  end

  # GET /bars/1
  # GET /bars/1.json
  def show
	@bar = Bar.find(params[:id])
	@reviews = @bar.reviews
    if @reviews.blank?
        @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  # GET /bars/1/edit
  def edit
  end

  # POST /bars
  # POST /bars.json
  def create
    @bar = Bar.new(bar_params)

    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar, notice: 'Bar was successfully created.' }
        format.json { render :show, status: :created, location: @bar }
      else
        format.html { render :new }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bars/1
  # PATCH/PUT /bars/1.json
  def update
    respond_to do |format|
      if @bar.update(bar_params)
        format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
        format.json { render :show, status: :ok, location: @bar }
      else
        format.html { render :edit }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

	def upvote
		@bar.upvote_by current_user
		redirect_to @bar
		end
		
	def downvote
		@bar.downvote_by current_user
		redirect_to @bar
		end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar.destroy
    respond_to do |format|
      format.html { redirect_to bars_url, notice: 'Bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = Bar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bar_params
      params.require(:bar).permit(:name, :bar, :address, :zipcode, :phone, :timing, :takesreservation, :parking, :goodforgroups, :ambience, :noiselevel, :goodfordancing, :alcohol, :happyhour, :smoking, :hastv)
    end
end
