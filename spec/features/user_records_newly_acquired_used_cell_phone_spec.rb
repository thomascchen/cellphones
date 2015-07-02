require 'rails_helper'

feature 'user creates newly acquired used cell phone', %{
  As a used phone salesperson
  I want to record a newly acquired used cell phone
  So that I can list it in my store

} do

# * Acceptance Criteria
#
# [x] I must specify the cell phone manufacturer, year and battery life (an association between the phone and an existing manufacturer should be created).
# [x] Only years from 2003 and above can be specified.
# [x] I can optionally specify a description of the phone.
# [x] If I enter all of the required information in the required formats, the phone is recorded and I am presented with a notification of success.
# [x] If I do not specify all of the required information in the required formats, the phone is not recorded and I am presented with errors.
# [x] Upon successfully creating a phone, I am redirected back to the index of phones.

  scenario 'user specifies valid phone information' do
    phone_manufacturer = PhoneManufacturer.create(name: "Motorola", country: "USA")

    visit phones_path
    click_link 'Add A Newly Acquired Used Cell Phone'
    select phone_manufacturer.name, from: "Phone Manufacturer"
    fill_in "Year", with: "2003"
    fill_in "Battery Life", with: "8 Hours"
    fill_in "Description", with: "Cool Phone"
    click_button "Submit"

    expect(page).to have_content("Used Cell Phones")
    expect(page).to have_content("2003")
    expect(page).to have_content("Phone successfully added")
  end

  scenario 'user specifies invalid phone information' do
    visit phones_path
    click_link 'Add A Newly Acquired Used Cell Phone'
    fill_in "Year", with: "2000"
    click_button "Submit"

    expect(page).to have_content("Year must be greater than or equal to 2003")
    expect(page).to have_content("can't be blank")
  end
end
