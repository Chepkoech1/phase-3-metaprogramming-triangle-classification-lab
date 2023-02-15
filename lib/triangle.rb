
class Triangle
  # write code here
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    if side1 <= 0 || side2 <= 0 || side3 <= 0
      raise TriangleError, "Sides can't be less than or equal to 0."
    elsif side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
      raise TriangleError, "The sum of any two sides must be greater than the third."
    end
  end

  class TriangleError < StandardError
  end
end
