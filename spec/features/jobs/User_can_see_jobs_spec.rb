require 'rails_helper'

feature "user can go to jobs index with ?sort=location" do
  it "will show all jobs by level of interest" do
    category      = Category.create(title: "aaah")
    company_1     = Company.create(name:"irs", city:"denver")
    company_2     = Company.create(name:"kkk", city:"denver")
    job           = Job.create(title:"stuff", description:"kasd", level_of_interest: 1, company:company_1, category:category)
    job_2         = Job.create(title:"stuff", description:"kasd", level_of_interest: 2, company:company_2, category:category)

    visit "/jobs?sort=location"
    save_and_open_page
    # within("ul > li:nth-child(1)")
    expect(page).to have_content("stuff with 2 level of interest rating.")


  end
end
