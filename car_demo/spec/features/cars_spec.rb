require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "Cars", type: :feature, js: true do

  before :each do
    @car1 = Car.create!(
      make: Make.create!(make: 'Lincoln'),
      model: Model.create!(model: 'M3'),
      trim: Trim.create(trim_level: 'XLE'),
      style: Style.create!(body_style: 'Extended Cab Pickup'),
      year: 1971,
      colour: 'Ruby Red'
    )

    @car2 = Car.create!(
      make: Make.create!(make: 'Buick'),
      model: Model.create!(model: 'Mustang'),
      trim: Trim.create(trim_level: 'XLE'),
      style: Style.create!(body_style: 'Passenger Van'),
      year: 1971,
      colour: 'Royal Blue'
    )
    visit cars_path

  end



  scenario "Visit the cars page" do


    save_screenshot 'visit_cars.png'

    expect(page).to have_text("All My Cars!")

  end

  scenario "Display all the cars on the page" do 

    save_screenshot 'all_cars.png'

    expect(page).to have_css('.car', count: 2)
    expect(page).to have_text('Lincoln M3 Extended Cab Pickup XLE 1971')
    expect(page).to have_text('Buick Mustang Passenger Van XLE 1971')
    
  end

  scenario "Display the cars according to the filter make" do


    within 'form' do 
    
      select 'Buick', from: 'Make'
      click_button 'Search!'
    
    end
    
    expect(page).to have_css('.car', count: 1)
    expect(page).to have_text('Buick Mustang Passenger Van XLE 1971')
    save_screenshot 'filtered_cars.png'
    
  end



end
