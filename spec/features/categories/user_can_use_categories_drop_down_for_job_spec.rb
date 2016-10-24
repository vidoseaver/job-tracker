require 'rails_helper'

describe "When a user adds a job they see a drop down for all the current categories" do
  scenario "user sees the present categories" do
    company = Company.create!(name:"all stars", city:"frankfurt")

    category_one = Category.create!(title:"stamp licker")
    category_two = Category.create!(title:"cto")

    visit new_company_job_path(company)

    expect(page).to have_content("stamp licker")
    expect(page).to have_content("cto")
  end
end
