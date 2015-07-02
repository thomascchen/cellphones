require 'rails_helper'

feature 'user create phone manufacturer in', %{
  As a used phone salesperson
  I want to record a phone manufacturer
  So that I can keep track of the types of phones found in the store

} do

# * Acceptance Criteria
#
# [x] I must specify a phone manufacturer name and country
# [x] If I do not specify the required information, I am presented with errors.
# [x] If I specify the required information, the phone manufacturer is recorded and I am redirected to the index of phone manufacturers

  scenario 'specify valid phone manufacturer information' do
    visit phone_manufacturers_path
    click_link "Add a Phone Manufacturer"
    fill_in "Name", with: "Motorola"
    fill_in "Country", with: "USA"
    click_button "Submit"

    expect(page).to have_content("Motorola")
    expect(page).to have_content("Phone Manufacturers")
  end

  scenario 'specifies invalid phone manufacturer information' do
    visit phone_manufacturers_path
    click_link "Add a Phone Manufacturer"
    click_button "Submit"

    expect(page).to have_content("can't be blank")
  end
end
