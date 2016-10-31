require 'rails_helper'


feature 'shows top three companies by average level of interest' do
    it "is boss" do
      company = Company.new
      category = Category.create(title:"whatever")
      company_first = Company.create(name:"turing", city:"denver")
      company_second = Company.create(name:"gschool", city:"denver")
      company_third = Company.create(name:"general academy", city:"denver")
      company_fourth = Company.create(name:"code school", city:"denver")
      job_25 = Job.create(title: "Consultant", level_of_interest: 50, description: "Wahooo",company:company_third, category:category)
      job_2 = Job.create(title: "Semi-retird", level_of_interest: 75, description: "Wahooo",company:company_second, category:category)
      job_1 = Job.create(title: "Retired", level_of_interest: 100, description: "Wahooo",company:company_first, category:category)
      job_3 = Job.create(title: "employed", level_of_interest: 25, description: "Wahooo",company:company_fourth, category:category)

      visit dashboard_path
      
      expect(page).to have_content("Turing has an average level of interest of 100.0")
      expect(page).to have_content("Gschool has an average level of interest of 75.0")
      expect(page).to have_content("General academy has an average level of interest of 50.0")
    end
end
