require 'rails_helper'

describe "User deletes a job" do
  scenario "a user can delete a job" do
    company =  Company.create(name: "ESPN", city: "NYC")
    category_one = Category.create!(title:"stamp licker")
    job     =  Job.create(title:"Corporate Slave", description:"whip the little minions", level_of_interest: 100, company:company, category:category_one)

    visit company_job_path(company, job)
    click_on "Delete"

    expect(page).to_not have_content(job.title)
    expect(page).to_not have_content(job.description)
  end

end
