require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new(city: "Denver")
        expect(company).to be_invalid
      end

      it "is invalid without a city" do
        company = Company.new(name: "Ericsson")
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox", city: "Denver")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name and city" do
        company = Company.new(name: "Dropbox", city: "Denver")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox", city: "Denver")
      expect(company).to respond_to(:jobs)
    end
  end

  describe "analysis" do
    it "shows the top three jobs by level average level of interest" do
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

      expect(company.show_top_three).to eq(["Turing has an average level of interest of 100.0", "Gschool has an average level of interest of 75.0", "General academy has an average level of interest of 50.0"])

    end
  end
end
