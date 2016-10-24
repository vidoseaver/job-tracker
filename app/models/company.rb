class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def show_top_three
    tre =
    Company.all.sort_by{|company| company.average_level_of_interest_score}.reverse[0..2]
    tre.map do |company|
      "#{company.name.capitalize} has an average level of interest of #{company.average_level_of_interest_score}"
    end
  end

  def average_level_of_interest_score
    jobs.average(:level_of_interest).to_f
  end
end
