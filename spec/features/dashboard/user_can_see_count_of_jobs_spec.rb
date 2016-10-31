require 'rails_helper'

feature "dashboard shows job count by level of interest" do
  it "shows 'em" do
    category = Category.create(title:"whatever")
    company = Company.create(name:"turing", city:"denver")
    job_1 = Job.create(title: "Software", level_of_interest: 1, description: "Wahooo",company:company, category:category)
    job_2 = Job.create(title: "Software", level_of_interest: 2, description: "Wahooo",company:company, category:category)
    job_25 = Job.create(title: "Software", level_of_interest: 2, description: "Wahooo",company:company, category:category)
    job_3 = Job.create(title: "Software", level_of_interest: 3, description: "Wahooo",company:company, category:category)

    visit dashboard_path

    expect(page).to have_content("There is 1 job with a level of interest of 3.")
    expect(page).to have_content("There is 1 job with a level of interest of 3.")
    expect(page).to have_content("There are 2 jobs with a level of interest of 2.")
    expect(page).to have_content("There are 2 jobs with a level of interest of 2.")
    expect(page).to have_content("There is 1 job with a level of interest of 1.")
    expect(page).to have_content("There is 1 job with a level of interest of 1.")
  end
end
