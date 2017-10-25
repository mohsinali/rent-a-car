class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new(:car_id => params[:car_id])
    @booking.build_customer
    @booking.references.build
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
        # update number of days  and booking payment in booking table
      # @booking.update_attributes({:number_of_days => (@booking.to_booking.to_date - @booking.from_booking.to_date).to_i, :booking_price=> (@booking.car.per_day_rent * @booking.number_of_days).to_i})

      # update number of days in booking table

      @booking.update_attribute(:number_of_days,(@booking.to_booking.to_date - @booking.from_booking.to_date).to_i)
      
      # update  booking payment in booking table

      @booking.update_attribute(:booking_price, (@booking.car.per_day_rent * @booking.number_of_days).to_i)
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:car_id, :customer_id, :booking_price, :from_booking,:to_booking, :advance_payment,customer_attributes:[:name,:cnic,:address,:phone],references_attributes:[:name,:address,:cnic,:phone])
    end
end

