require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        job = Job.new(title: "Developer", level_of_interest: 40)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end

  describe "analysis" do
    it "it can show a count of jobs by level of interest" do
      category = Category.create(title:"whatever")
      company = Company.create(name:"turing", city:"denver")
      job = Job.new
      job_1 = Job.create(title: "Software", level_of_interest: 1, description: "Wahooo",company:company, category:category)
      job_2 = Job.create(title: "Software", level_of_interest: 2, description: "Wahooo",company:company, category:category)
      job_25 = Job.create(title: "Software", level_of_interest: 2, description: "Wahooo",company:company, category:category)
      job_3 = Job.create(title: "Software", level_of_interest: 3, description: "Wahooo",company:company, category:category)

      expect(job.show_by_count_of_jobs_by_level_of_interest).to eq(["There is 1 job with a level of interest of 3.", "There are 2 jobs with a level of interest of 2.", "There is 1 job with a level of interest of 1."])
    end
  end
end
