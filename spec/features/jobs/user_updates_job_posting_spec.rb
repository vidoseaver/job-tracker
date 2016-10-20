require 'rails_helper'

describe "Users updates a job" do
  scenario "a user can can update a job" do
    company =  Company.create(name: "ESPN", city: "NYC")
    job = Job.create(title:"Corporate Slave", level_of_interest: 100, company:company)

    visit company_job_path(company, job)
    click_on "Update"
    fill_in "job[title]", with: "lead propaganda producer"
    fill_in "job[description]", with: "white picket fence incoming"
    fill_in "job[level_of_interest]", with: 100

    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("lead propaganda producer")
    expect(page).to have_content("white picket fence incoming")
    expect(page).to have_content(100)
  end
end
