# ***!!! DON'T FORGET TO CHANGE THE NUMBER OF CREATURES !!! ****

puts 'Cleaning database...'
Creature.destroy_all
User.destroy_all
Booking.destroy_all

puts "Setting address variables"
STREETS = ["Boulevard Adolphe Max", "Rue d'Aerschot", "Avenue Albert", "Chaussée d'Alsemberg", "Boulevard Anspach", "Rue Antoine Dansaert", "Boulevard Auguste Reyers", "Rue du Bailli", "Rue Belliard", "Boulevard Brand Whitlock", "Avenue Brugmann", "Boulevard du Centenaire", "Chaussée de Charleroi", "Avenue Charles Quint", "Avenue des Croix du Feu", "Avenue De Fré", "Boulevard de Smet de Naeyer", "Boulevard Edmond Machtens", "Boulevard Emile Jacqmain", "Boulevard de l'Empereur", "Avenue de l'Exposition", "Avenue de l'Exposition Universelle", "Avenue Fonsny", "Avenue Franklin Roosevelt", "Chaussée de Gand", "Boulevard Général Jacques", "Boulevard Général Wahis", "Chaussée de Haecht", "Avenue Houba de Strooper", "Boulevard de l'Impératrice", "Boulevard Industriel", "Chaussée d'Ixelles", "Avenue de Jette", "Chaussée de Jette", "Chaussée de La Hulpe", "Boulevard Lambermont", "Boulevard Lépold II", "Avenue Léopold III", "Rue de la Loi", "Boulevard Louis Mettewie", "Boulevard Louis Schmidt", "Avenue Louise", "Chaussée de Louvain", "Boulevard Maurice Lemonnier", "Rue du Midi", "Chaussée de Mons", "Rue Neuve", "Chaussée de Ninove", "Boulevard Pachéco", "Boulevard Paepsem", "Avenue du Parc", "Avenue du Parc Royal", "Boulevard de la Plaine", "Boulevard Prince de Liège", "Avenue de la Reine", "Avenue de Roodebeek", "Rue Royale", "Boulevard Saint-Michel", "Boulevard du Souverain", "Rue de Stalle", "Boulevard Sylvain Dupuis", "Avenue de Tervueren", "Boulevard du Triomphe", "Quai des Usines", "Avenue Van Praet", "Avenue Van Volxem", "Rue Victor Hugo", "Avenue de Vilvorde", "Chaussée de Vleurgat", "Chaussée de Waterloo", "Chaussée de Wavre", "Avenue Wielemans Ceuppens", "Avenue Winston Churchill", "Boulevard de la Woluwe"]
STREET_NUMBERS = (10..20).to_a
CITY = "Brussels"

puts "Setting creature variables"
CREATURE_NAMES = ["Abarta", "Abhartach", "Adhene", "Aeternae", "Am Fear Liath Mòr", "Animalia Paradoxa", "Aos Sí", "Arkan Sonney", "Bánánach", "Banshee", "Baobhan sith", "Barbegazi", "Bean nighe", "Black dog", "Bodach", "Bogle", "Bonnacon", "Buggane", "Caoineag", "Cat sìth", "Changeling", "Clíodhna", "Clurichaun", "Cù Sìth", "Daoine maithe", "Demogorgon", "Dobhar-chú", "Dullahan", "Each-uisge", "Elemental", "Ellén Trechend", "Dragon", "Fachan", "Fairy", "Far darrig", "Fear gorta", "Fenodyree", "Fetch", "Fuath", "Gancanagh", "Glaistig", "Gnome", "Goblin", "Gremlin", "Grendel", "Griffin", "Hag", "Hellhound", "Ichneumon", "Joint-eater", "Lampago", "Leanan sídhe", "Maa-alused", "Manticore", "Melusine", "Merrow", "Ogre", "Oilliphéist", "Ouroboros", "Púca", "Puck", "Questing Beast", "Selkie", "Shellycoat", "Shtojzovalle", "Skrat", "Sluagh", "Sprite", "Swan maiden", "White Lady", "Wiedergänger", "Xindhi", "Yuxa"]
DESCRIPTION = "Lorem ipsum dolores"
CARE = "Lorem ipsum dolores"
DIET = "Lorem ipsum dolores"
PICTURE_URLS = ["https://res.cloudinary.com/robopro/image/upload/v1529481951/mythy_seed_creatures/2bb80d4380b6af22084cd5c018f2a787.jpg",
                "https://res.cloudinary.com/robopro/image/upload/v1529485531/mythy_seed_creatures/9501310_orig.jpg",
                "https://res.cloudinary.com/robopro/image/upload/v1529485532/mythy_seed_creatures/Cerberus-Creature-Greek-Mythology-1024x1024.jpg",
                "https://res.cloudinary.com/robopro/image/upload/v1529485534/mythy_seed_creatures/dragon.jpg",
                "https://res.cloudinary.com/robopro/image/upload/v1529485536/mythy_seed_creatures/kittelsen.jpg",
                "https://res.cloudinary.com/robopro/image/upload/v1529485538/mythy_seed_creatures/kraken-cryptid-real.jpg",
                "https://res.cloudinary.com/robopro/image/upload/v1529485540/mythy_seed_creatures/maxresdefault.jpg",
                "https://res.cloudinary.com/robopro/image/upload/v1529485542/mythy_seed_creatures/seaserpent.jpg",
                "https://res.cloudinary.com/robopro/image/upload/v1529485544/mythy_seed_creatures/top-4-mythical-creatures-ppcorn.jpg",
                "https://res.cloudinary.com/robopro/image/upload/v1529485581/mythy_seed_creatures/depositphotos_18411895_original.jpg"]
price = (5..10).to_a
price.each_with_index do |x, i|
  price[i] = x * 100
end
BOOLS = [true, false]

puts 'Setting users variable'
USERS = [
  {email: "user01@test.com", password: "password", password_confirmation: "password"},
  {email: "user02@test.com", password: "password", password_confirmation: "password"},
  {email: "user03@test.com", password: "password", password_confirmation: "password"},
  {email: "user04@test.com", password: "password", password_confirmation: "password"},
  {email: "user05@test.com", password: "password", password_confirmation: "password"}
]

puts 'Creating users'
User.create!(USERS)

puts 'Creating creatures'
creatures = []
# CHANGE NUMBER OF CREATURES TO MORE FOR HEROKU!!!
5.times do
  new_creature =Creature.new({user: User.all.sample,
                              name: CREATURE_NAMES.sample,
                              address: "#{STREET_NUMBERS.sample} #{STREETS.sample}, #{CITY}",
                              price: price.sample,
                              description: DESCRIPTION,
                              care: CARE,
                              diet: DIET,
                              wifi: BOOLS.sample,
                              fly: BOOLS.sample,
                              mount: BOOLS.sample,
                              dangerous: BOOLS.sample,
                              shitty: BOOLS.sample,
                              domestic: BOOLS.sample})
  new_creature.remote_picture_url = PICTURE_URLS.sample
  new_creature.save
end

puts "Setting bookin dates"
DAYS = (1..28).to_a
START_MONTHS = (7..9).to_a
END_MONTHS = (10..12).to_a

puts 'Creating bookings'
Creature.all.each do |creature|
  new_booking =Booking.new({start_date: Date.new(2018, START_MONTHS.sample, DAYS.sample),
                            end_date: Date.new(2018, END_MONTHS.sample, DAYS.sample),
                            user: User.all.sample,
                            creature: creature})
  new_booking.save
end

puts 'Finished!'

