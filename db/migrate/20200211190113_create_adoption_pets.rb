class CreateAdoptionPets < ActiveRecord::Migration[5.1]
  def change
    create_table :adoption_pets do |t|
      t.references :pet, foreign_key: true
      t.references :adoption, foreign_key: true
      t.timestamps
    end
  end
end
