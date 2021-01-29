class BookinsController < ApplicationController
  
  def new 
    @bookin = Bookin.new
    @selected_flight = Flight.find(params[:flight])
    @passengers_count = params[:pax].to_i
    @passengers_count.times { @bookin.passengers.build}
  end

  def create 
    @bookin = Bookin.new(bookin_params)

    if @bookin.save
      flash[:notice] = "Booking successfully completed"
      @bookin.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).thankyou_email.deliver_now
      end
      redirect_to bookin_path(@bookin)

    else  
      flash[:alert] = "An error occured"
      render :new
    end
  end

  def show
    @bookin = Bookin.find(params[:id])
  end
  
  private

  def bookin_params
    params.require(:bookin).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
