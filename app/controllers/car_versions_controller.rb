class CarVersionsController < ApplicationController
  before_action :set_car_version, only: [:show, :edit, :update, :destroy]

  # GET /car_versions
  # GET /car_versions.json
  def index
    @car_versions = CarVersion.all
  end

  # GET /car_versions/1
  # GET /car_versions/1.json
  def show
  end

  # GET /car_versions/new
  def new
    @car_version = CarVersion.new
  end

  # GET /car_versions/1/edit
  def edit
  end

  # POST /car_versions
  # POST /car_versions.json
  def create
    @car_version = CarVersion.new(car_version_params)

    respond_to do |format|
      if @car_version.save
        format.html { redirect_to @car_version, notice: 'Car version was successfully created.' }
        format.json { render :show, status: :created, location: @car_version }
      else
        format.html { render :new }
        format.json { render json: @car_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_versions/1
  # PATCH/PUT /car_versions/1.json
  def update
    respond_to do |format|
      if @car_version.update(car_version_params)
        format.html { redirect_to @car_version, notice: 'Car version was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_version }
      else
        format.html { render :edit }
        format.json { render json: @car_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_versions/1
  # DELETE /car_versions/1.json
  def destroy
    @car_version.destroy
    respond_to do |format|
      format.html { redirect_to car_versions_url, notice: 'Car version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_version
      @car_version = CarVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_version_params
      params.require(:car_version).permit(:name, :car_model_id)
    end
end
