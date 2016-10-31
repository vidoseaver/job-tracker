require "rails_helper"

feature "it shows a list of links that go to the respective cities" do
  it "has the links" do
    company_1     = Company.create(name:"irs", city:"denver")
    company_2     = Company.create(name:"kkk", city:"chi-town")

    visit dashboard_path

    expect find_link('denver').visible?
    expect find_link('chi-town').visible?
  end

  it "those links work and take you to a page that displays job count and companies" do
    category      = Category.create(title: "aaah")
    company_1     = Company.create(name:"irs", city:"denver")
    company_2     = Company.create(name:"kkk", city:"denver")
    job           = Job.create(title:"stuff", description:"kasd", level_of_interest: 1, company:company_1, category:category)
    job_2         = Job.create(title:"stuff", description:"kasd", level_of_interest: 1, company:company_2, category:category)

    visit dashboard_path
    click_on "denver"
    expect(page).to have_content(company_1.name)
    expect(page).to have_content(company_2.name)

    expect(page).to have_content(2)
  end
end
