require "prawn"

class HexaFuelAssembly

  include Prawn::View

  def initialize(name)
    @name = name
  end

  def say_hello
    # Generate the text

    text_box "This is #{@name} Fuel Assembly!",
    :at => [50, 220]

    text_box "Fuel Pin Structure",
              :at => [350, 180]


  end

  def assembly
    # Hexagon
    polygon [50, 150], [150, 200], [250, 150], [250, 50], [150, 0], [50, 50]
  end

  def fuelpin
    x = 75
    for i in 0..5
      y = 130
      for j in 0..2
        stroke_circle [x, y], 10
        stroke_circle [x, y], 5
        y-=30
      end
      x+=30
    end

    x = 75

    for i in 0..3
      x+=30
      stroke_circle [x, 160], 10
      stroke_circle [x, 160], 5
    end

    x = 75

    for i in 0..3
      x+=30
      stroke_circle [x, 40], 10
      stroke_circle [x, 40], 5
    end

    # stroke_circle [150, 185], 10
    # stroke_circle [150, 185], 5

    # stroke_circle [150, 20], 10
    # stroke_circle [150, 20], 5

    
  end

  def fuelpinstructure
    stroke_circle [400, 100], 50
    stroke_circle [400, 100], 30
    stroke_circle [400, 100], 25
    stroke_circle [400, 100], 23
  end

end

class RectFuelAssembly

  include Prawn::View

  def initialize(name)
    @name = name
  end

  def say_hello
    # Generate the text

    text_box "This is #{@name} Fuel Assembly!",
    :at => [50, 220]

    text_box "Fuel Pin Structure",
              :at => [350, 180]


  end

  def assembly
    stroke do
      rectangle [60, 180], 180, 180
    end
  end

  def fuelpin
    x = 75
    for i in 0..5
      y = 130
      for j in 0..2
        stroke_circle [x, y], 10
        stroke_circle [x, y], 5
        y-=30
      end
      x+=30
    end

    x = 75

    for i in 0..5
      stroke_circle [x, 160], 10
      stroke_circle [x, 160], 5
      x+=30
    end

    x = 75

    for i in 0..5
      stroke_circle [x, 40], 10
      stroke_circle [x, 40], 5
      x+=30
    end

    # stroke_circle [150, 185], 10
    # stroke_circle [150, 185], 5

    # stroke_circle [150, 20], 10
    # stroke_circle [150, 20], 5

    
  end

  def fuelpinstructure
    stroke_circle [400, 100], 50
    stroke_circle [400, 100], 30
    stroke_circle [400, 100], 25
    stroke_circle [400, 100], 23
  end

end

# printpdf = HexaFuelAssembly.new("Hexagonal")

# printpdf.say_hello
# printpdf.assembly
# printpdf.fuelpin
# printpdf.fuelpinstructure

printpdf = RectFuelAssembly.new("Rectangular")

printpdf.say_hello
printpdf.assembly
printpdf.fuelpin
printpdf.fuelpinstructure

printpdf.save_as("KLT40s.pdf")


