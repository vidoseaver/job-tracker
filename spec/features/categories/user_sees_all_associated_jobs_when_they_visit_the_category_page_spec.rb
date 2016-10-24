require "rails_helper"

describe "they see all the jobs" do
  it "text" do
    category = Category.create(title: "paper pusher")
    company = Company.create(name:"irs", city:"Dc")
    company_two = Company.create(name:"mvp", city:"Dc")
    job_one =  Job.create(title: "auditor", description: "devil job", level_of_interest: 1, company: company, category: category)
    job_two =  Job.create(title: "devil in disguise", description: "devil manager", level_of_interest: 1, company: company_two, category: category)

    visit category_path(category)
    

    expect(page).to have_content("auditor")
    expect(page).to have_content("devil in disguise")

  end

end
