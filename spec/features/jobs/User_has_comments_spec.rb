require "rails_helper"

feature "the comments display" do
  it "in from younger to older, by date created" do
    company  = Company.create(name:"irs", city:"denver")
    category = Category.create(title:"smoker")
    job      = Job.create(title:"chief", description:"foney", level_of_interest:1, company:company, category:category)
    comment_one  = Comment.create(content:"first",  job:job)
    comment_two  = Comment.create(content:"second", job:job)

    visit company_job_path(company, job)
    # within(:css,"li:first-child)")
    expect(page).to have_content(comment_two.content)
    # within(:css, "second-child li")
    expect(page).to have_content(comment_one.content)
  end

  it "you can add a comment and it redirects back" do
    company  = Company.create(name:"irs", city:"denver")
    category = Category.create(title:"smoker")
    job      = Job.create(title:"chief", description:"foney", level_of_interest:1, company:company, category:category)

    visit company_job_path(company, job)

    fill_in "comment_content", with:"test"
    click_on "Create Comment"

    expect(page).to have_content("test")

  end
end
