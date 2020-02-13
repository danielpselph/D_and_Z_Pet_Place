# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Adoption.destroy_all
Review.destroy_all
Pet.destroy_all
Shelter.destroy_all

shelter_1 = Shelter.create(name: "STANKY dawgs",
  address: "42 Wallaby Way",
  city: "Sydney",
  state: "OZ",
  zip: "12345"
)
shelter_2 = Shelter.create(name: "(We're gonna) Let Tha Dogs Out",
  address: "11 Pine Street",
  city: "Austin",
  state: "TX",
  zip: "54321"
)
shelter_3 = Shelter.create(name: "Happy Homes 4 All",
  address: "1600 Pennsylvania Avenue",
  city: "Washington",
  state: "DC",
  zip: "98765"
)
pet_1 = Pet.create(name: "Fido",
  age: "6 weeks",
  sex: "M",
  description: "Absolute unit.",
  image: "https://nationalpostcom.files.wordpress.com/2019/12/tarzan-2.jpg?quality=80&strip=all&w=780&zoom=2",
  shelter_id: "#{shelter_1.id}",
  status: "It's complicated"
  )
pet_2 = Pet.create(name: "Peter",
  age: "8 years",
  sex: "M",
  description: "Big doofus",
  image: "https://media4.s-nbcnews.com/i/newscms/2016_52/1184388/rescue-group-old-dog-haven-today-161226-tease-01_00bac92f7fa6330b327ff47cdd4acdf2.jpg",
  shelter_id: "#{shelter_3.id}",
  status: "Single af"
  )
pet_3 = Pet.create(name: "Boo",
  age: "10 months",
  sex: "F",
  description: "Cuddle monster",
  image: "https://www.pets4homes.co.uk/images/articles/686/large/1cd87f6bfb8e33796dbba267173798fa.jpg",
  shelter_id: "#{shelter_1.id}",
  status: "Available"
  )
pet_4 = Pet.create(name: "Brutus",
  age: "2 years",
  sex: "F",
  description: "Chonk",
  image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg",
  shelter_id: "#{shelter_2.id}",
  status: "Claimed"
  )
pet_5 = Pet.create(name: "Mr. Bubbles the Assassin",
  age: "14 years",
  sex: "M",
  description: "Don't get on his bad side.",
  image: "https://previews.123rf.com/images/cynoclub/cynoclub1606/cynoclub160600391/58947192-old-chihuahua-with-cataract-in-front-of-white-background.jpg",
  shelter_id: "#{shelter_2.id}",
  status: "He chooses his owner, not the other way around."
  )
pet_6 = Pet.create(name: "Pancho",
  age: "We thought he was 10 when he came in off the streets, but he's been here for 20 years now, so who knows.",
  sex: "M",
  description: "Tried and true",
  image: "https://envato-shoebox-0.imgix.net/f9f3/6b74-bade-11e2-952c-842b2b692e1a/2013_012_383.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=700&s=17f5070a831014b0036df1c137a7d811",
  shelter_id: "#{shelter_1.id}",
  status: "Give an old boy a home"
  )
pet_7 = Pet.create(name: "Halley Boxer",
  age: "1.5 years",
  sex: "F",
  description: "You'll end up loving her more than your own kids. Perfect darling dog.",
  image: "https://i.ytimg.com/vi/D2eDVAfyUns/maxresdefault.jpg",
  shelter_id: "#{shelter_3.id}",
  status: "Adoptable"
  )
pet_8 = Pet.create(name: "Puff the Magic Dragon",
  age: "17 years",
  sex: "F",
  description: "A freakin' dragon, okay??",
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSpnzO0IxNYQCveRllPVTAPNqmhYhKqPFIwhFHLt4phfru4i0yk",
  shelter_id: "#{shelter_3.id}",
  status: "Take her if you can."
  )
@review_1 = Review.create(title: "peeeeyew",
  rating: 1,
  content: "The dog you sold me stinks. Like, literally.",
  shelter_id: "#{shelter_1.id}",
  image: " ")
@review_2 = Review.create(title: "Ugly Dog",
  rating: 4,
  content: "My new pal scruff is a dream, but damn is that boy ugly.",
  shelter_id: "#{shelter_1.id}",
  image: " ")
@review_3 = Review.create(title: "OUT OF CONTROL",
  rating: 5,
  content: "They really did let the dogs out. They were everywhere. I almost died.",
  shelter_id: "#{shelter_2.id}",
  image: " ")
@review_4 = Review.create(title: "Where...?",
  rating: 1,
  content: "I couldn't find it on the map.",
  shelter_id: "#{shelter_2.id}",
  image: " ")
@review_5 = Review.create(title: "Found my guilty pleasure.",
  rating: 3,
  content: "They didn't have any dogs. Apparently their last intern let them all out, screaming 'Fly, my pretties!' Tasty dog treats tho.",
  shelter_id: "#{shelter_2.id}",
  image: " ")
@review_6 = Review.create(title: "Man, what a rascal.",
  rating: 2,
  content: "My home was happier before I adopted from here. What a pain.",
  shelter_id: "#{shelter_3.id}",
  image: " ")
