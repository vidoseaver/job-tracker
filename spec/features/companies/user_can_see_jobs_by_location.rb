require "rails_helper"

feature "page shows company with the jobs by location" do
  it "does the thing" do
    category      = Category.create(title: "aaah")
    company_1     = Company.create(name:"irs", city:"denver")
    company_2     = Company.create(name:"kkk", city:"textas")
    job           = Job.create(title:"stuff", description:"kasd", level_of_interest: 1, company:company_1, category:category)
    job_2         = Job.create(title:"stuff", description:"kasd", level_of_interest: 2, company:company_2, category:category)

    visit "/companies?sort=location"

  end
end
