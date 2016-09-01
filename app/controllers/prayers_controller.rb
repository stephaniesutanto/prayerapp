class PrayersController < ApplicationController
  before_action :set_prayer, only: [:show, :edit, :update, :destroy]

  # GET /prayers
  # GET /prayers.json
  def index
    @prayers = Prayer.all
  end

  # GET /prayers/1
  # GET /prayers/1.json
  def show
  end

  # GET /prayers/new
  def new
    @prayer = Prayer.new
  end

  # GET /prayers/1/edit
  def edit
  end

  # POST /prayers
  # POST /prayers.json
  def create
    @prayer = Prayer.new(prayer_params)

    respond_to do |format|
      if @prayer.save
        format.html { redirect_to @prayer, notice: 'Prayer was successfully created.' }
        format.json { render :show, status: :created, location: @prayer }
      else
        format.html { render :new }
        format.json { render json: @prayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prayers/1
  # PATCH/PUT /prayers/1.json
  def update
    respond_to do |format|
      if @prayer.update(prayer_params)
        format.html { redirect_to @prayer, notice: 'Prayer was successfully updated.' }
        format.json { render :show, status: :ok, location: @prayer }
      else
        format.html { render :edit }
        format.json { render json: @prayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prayers/1
  # DELETE /prayers/1.json
  def destroy
    @prayer.destroy
    respond_to do |format|
      format.html { redirect_to prayers_url, notice: 'Prayer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prayer
      @prayer = Prayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prayer_params
      params.require(:prayer).permit(:name, :description, :category, :pray, :status)
    end
end
