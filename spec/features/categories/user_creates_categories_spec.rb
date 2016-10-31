require 'rails_helper'

describe "User creates a new category" do
  scenario "user can create a new category" do

  visit new_category_path

  fill_in "category[title]", with: "profesional rapper"
  click_on "Create"

  expect(current_path).to eq("/categories/#{Category.last.id}")
  expect(page).to have_content("profesional rapper")
  end

  scenario "when they successfully create a new category they are shown it" do
    visit new_category_path

    fill_in "category[title]", with: "profesional rapper"
    click_on "Create"
    expect(current_path).to eq("/categories/#{Category.last.id}")
  end

  scenario "when the categories already exists they get sent back to category page" do
    category = Category.create(title:"profesional rapper")

    visit new_category_path

    fill_in "category[title]", with: "profesional rapper"
    click_on "Create"

    expect(current_path).to eq("/categories/new")

    expect(page).to have_content("Add Category")

  end
end
