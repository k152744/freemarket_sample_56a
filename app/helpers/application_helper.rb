module ApplicationHelper
  def count_points(points)
    point_sum = 0
    points.each do |point|
      point_sum += point.number
    end
    return point_sum
  end
end
