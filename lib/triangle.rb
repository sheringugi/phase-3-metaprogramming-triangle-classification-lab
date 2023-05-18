class Triangle
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
    validate_positive_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    if side1 <= 0 || side2 <= 0 || side3 <= 0
      raise TriangleError, "Sides of a triangle must be larger than 0."
    end
  end

  def validate_triangle_inequality
    if side1 + side2 <= side3 || side2 + side3 <= side1 || side1 + side3 <= side2
      raise TriangleError, "Invalid triangle. The sum of the lengths of any two sides must exceed the length of the third side."
    end
  end

  class TriangleError < StandardError
  end
end
