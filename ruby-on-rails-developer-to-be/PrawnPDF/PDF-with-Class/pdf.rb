require "prawn"

class HelloPDF

  include Prawn::View

  def initialize(name)
    @name = name
  end

  def say_hello
    # Generate the text
    text "Hello #{@name}!"
  end

  def say_hi
    # Generate the text
    text "Hi #{@name}!"
  end

end

hello = HelloPDF.new("Argon")

hello.say_hello
hello.say_hi

hello.save_as("Hello.pdf")



# # Generate the hello.pdf
# Prawn::Document.generate("hello.pdf") do



#   # generate the axis
#   stroke_axis

#   # Make Circle at coordinate(x,y) 0,0 with radius 10
#   stroke_circle [0,0], 10

#   # generate the bounding box from top-lef corner of the box at coordinate(x,y) 100, 300 with width of 300 and height of 200
#   bounding_box([100, 300], :width => 300, :height => 200) do
#     stroke_bounds
#     stroke_circle [300, 200], 10
#   end

#   # 
# end

# # Generate the cursor.pdf
# Prawn::Document.generate("cursor.pdf") do

#   # generate the axis
#   stroke_axis

#   #initial cursor position
#   text "the cursor is here : #{cursor}" 

#   # move down 200 from initial position
#   move_down 200
#   text "the cursor right now is here : #{cursor}"

#   # move up 100 from latest position
#   move_up 100
#   text "the cursor right now is here : #{cursor}"

#   # move to position 50
#   move_cursor_to 50
#   text "the cursor right now is here : #{cursor}"
# end

# Prawn::Document.generate("doublepages.pdf") do
#     # Generate the text
#     text "Hello World!"

#     # generate the axis
#     stroke_axis
  
#     # Make Circle at coordinate(x,y) 0,0 with radius 10
#     stroke_circle [0,0], 10
  
#     # generate the bounding box from top-lef corner of the box at coordinate(x,y) 100, 300 with width of 300 and height of 200
#     bounding_box([100, 300], :width => 300, :height => 200) do
#       stroke_bounds
#       stroke_circle [300, 200], 10
#     end

#     # next page
#     start_new_page

#     # generate the axis
#     stroke_axis

#     #initial cursor position
#     text "the cursor is here : #{cursor}" 

#     # move down 200 from initial position
#     move_down 200
#     text "the cursor right now is here : #{cursor}"

#     # move up 100 from latest position
#     move_up 100
#     text "the cursor right now is here : #{cursor}"

#     # move to position 50
#     move_cursor_to 50
#     text "the cursor right now is here : #{cursor}"


# end

