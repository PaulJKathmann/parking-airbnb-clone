module ApplicationHelper
  def render_title
  return @title if defined?(@title)
  "Parking Dog"
end
end
