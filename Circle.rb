class Circle
  attr_accessor :r
  PI =3.14
  def initialize(r)
    @r = r

  end
  def perimeter

    2 * PI * r
  end

  def area

    2 * PI * r**2
  end

end
