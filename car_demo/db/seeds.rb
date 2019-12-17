5.times do
  Make.create!(make: Faker::Vehicle.make)
end

5.times do
  Model.create!(model: Faker::Vehicle.model)
end

5.times do
  Trim.create!(trim_level: Faker::Vehicle.style)
end

5.times do
  Style.create(body_style: Faker::Vehicle.car_type)
end

makes = Make.all.uniq.to_a
models = Model.all.uniq.to_a
styles = Style.all.uniq.to_a
trims = Trim.all.uniq.to_a

# Creating 50 random cars
50.times do

  Car.create!({
    make: makes.sample,
    model: models.sample,
    style: styles.sample,
    trim: trims.sample,
    year: rand(1950..2019),
    colour: Faker::Color.color_name.capitalize,
  })
end
