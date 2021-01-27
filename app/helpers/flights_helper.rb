module FlightsHelper
  def flight_params
    params.requires(:flight).permit(:from_airport_id, :to_airport_id, :duration, :schedule_on)
  end
end
