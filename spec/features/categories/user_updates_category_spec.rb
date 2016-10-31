require 'rails_helper'
require 'database_cleaner'

describe "User edits an existing category" do
  scenario "a user can click edit" do
    category = Category.create!(title: "King")
    visit category_path(category.id)

    click_on "Edit"

    expect(page).to have_content("Edit Category #{category.title}")
  end

  scenario "user can edit once they click" do
    category = Category.create(title: "King")

    visit category_path(category.id)
    click_on "Edit"
    fill_in "category[title]", with: "grape smuggler"
    click_on "Update"

    expect(page).to have_content("grape smuggler")
  end
end
