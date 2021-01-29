class PassengerMailer < ApplicationMailer
  default from: 'feb130201@gmail.com'

  def thankyou_email
    @passenger = params[:passenger]
    @departure_airport = @passenger.bookin.flight.from_airport.code
    @arrival_airport = @passenger.bookin.flight.to_airport.code
    @selected_date = @passenger.bookin.flight.schedule_on.strftime('%B %d, %Y')
    @scheduled_time = @passenger.bookin.flight.schedule_on.strftime('%H:%M')
    @arrival_time = (@passenger.bookin.flight.schedule_on + (@passenger.bookin.flight.duration/60).to_i.hours).strftime('%H:%M')
    mail(to: @passenger.email, subject: 'Thank you for booking flight')
  end
end
