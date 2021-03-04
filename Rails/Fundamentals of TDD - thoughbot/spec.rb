# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

require "rspec/autorun"

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here

  def full_name

    [@first_name, @middle_name, @last_name].compact.join(' ')

  end

  def without_middle_name

    [@first_name, @last_name].compact.join(' ')

  end

  def with_middle_name_initial
    [@first_name, @middle_name[0], @last_name].compact.join(' ')
  end

  def with_full_name_initial
    [@first_name[0], @middle_name[0], @last_name[0]].compact.join(' ')
  end

end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      @person = Person.new(first_name: "Roni", middle_name: "Sukarna", last_name: "Simanjuntak")

      expect(@person.full_name).to eq("Roni Sukarna Simanjuntak")
    end
    it "does not add extra spaces if middle name is missing" do
    
      @person = Person.new(first_name: "Roni", middle_name: "Sukarna", last_name: "Simanjuntak")

      expect(@person.without_middle_name).to eq("Roni Simanjuntak")

    end
  end

  describe "#full_name_with_middle_initial" do
    it "when the middle name write with the initial only" do
      @person = Person.new(first_name: "Roni", middle_name: "Sukarna", last_name: "Simanjuntak")

      expect(@person.with_middle_name_initial).to eq("Roni S Simanjuntak")
      
    end
  end


  describe "#initials"

  it "all the name is write with the initial only" do
    @person = Person.new(first_name: "Roni", middle_name: "Sukarna", last_name: "Simanjuntak")

    expect(@person.with_full_name_initial).to eq("R S S")
    
  end
end
