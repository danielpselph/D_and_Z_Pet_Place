class Favorites
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Array.new
  end

  def total_count
    @contents.length
  end

  def add_pet(id)
    @contents << id
  end
end