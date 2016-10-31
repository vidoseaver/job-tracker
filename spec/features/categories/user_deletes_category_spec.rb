require "rails_helper"

describe "user deletes a category" do
  scenario "user clicks the delete button from index" do
    category  = Category.create(title: "the one to be deleted")

    visit categories_path

    click_on "Delete"

    expect(page).to_not have_content("the one to be deleted")
  end
end
