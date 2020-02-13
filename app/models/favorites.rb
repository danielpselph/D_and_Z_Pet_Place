class Favorites
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Array.new
  end

  def total_count
    contents.length
  end

  def add_pet(id)
    contents << id
  end

  def delete_favorites(pet_ids)
    pet_ids.each do |id|
      contents.delete(id.to_i)
    end
  end
end
