class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

def create
    currentUser = params[:currentUser]
    showingId = params[:showingId]
    selectedSeats = params[:selectedSeats]
    
    selectedSeats.each do |seatNum|
     
     seat = Seat.find_by(number: seatNum, screen_id: Showing.find(showingId).screen_id).id
     puts "Seat number: #{seat}"
    @booking = Booking.create(user_id: currentUser, showing_id: showingId, seat_id: seat )

    end

    # Most már feldolgozhatod a selectedSeats adatokat és elvégezheted a szükséges műveleteket,
    # például mentheted az adatbázisba, vagy további feldolgozásokat végezheted rajta.

    render json: { status: 'success' } # Visszaküldheted egy JSON válasszal a kliensnek
  end
=begin
  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
=end
  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:user_id, :showing_id, :seat_id)
    end
end
