require "rails_helper"

RSpec.feature "create new contact" do
  it "shows after being created" do
    category_one = Category.create!(title:"stamp licker")
    company     = Company.create(name:"irs", city:"denver")
    job = company.jobs.create(title: "Developer", description:"stuff", level_of_interest: 70, category:category_one)
    contact_one = Contact.create(first_name: "first_name",  last_name:"last_name", position: "position", email:"email", company: company)

    visit company_path(company)

    fill_in "contact[first_name]", with: "person"
    fill_in "contact[last_name]", with: "person_last_name"
    fill_in "contact[position]", with: "ceo"
    fill_in "contact[email]", with: "person@company.com"
    click_on "Create Contact"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("person")
    expect(page).to have_content("person_last_name")
    expect(page).to have_content("ceo")
    expect(page).to have_content("person@company.com")

  end
end
