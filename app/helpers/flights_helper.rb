module FlightsHelper
  def format_duration(minutes)
    hours = minutes / 60
    mins = minutes % 60
    "#{hours}h #{mins}m"
  end
end
