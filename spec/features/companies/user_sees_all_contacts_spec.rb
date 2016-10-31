require 'rails_helper'

RSpec.feature "for a specific company" do
  it "shows the contacts most recent first" do
    category_one = Category.create!(title:"stamp licker")
    company     = Company.create(name:"irs", city:"denver")
    job = company.jobs.create(title: "Developer", description:"stuff", level_of_interest: 70, category:category_one)
    contact_one = Contact.create(first_name: "first_name",  last_name:"last_name", position: "position", email:"email", company: company)
    contact_two = Contact.create(first_name: "Second_name",  last_name:"Second_last_name", position: "Second_position", email:"Second_email", company: company)
    visit company_path(company)
    expect(page).to have_content ("first_name")
    expect(page).to have_content ("last_name")
    expect(page).to have_content ("position")
    expect(page).to have_content ("email")
    expect(page).to have_content ("Second_name")
    expect(page).to have_content ("Second_last_name")
    expect(page).to have_content ("Second_position")
    expect(page).to have_content ("Second_email")
  end
end
