class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def show_by_count_of_jobs_by_level_of_interest
    count_to_jobs =
    Job.order(:level_of_interest).reverse.group_by {|job| job.level_of_interest}
    prepared = count_to_jobs.map do |level_of_interest,job|
      "There #{grammar_corrector(job)} with a level of interest of #{level_of_interest}."
    end
  end

  def grammar_corrector(job)
    return "is 1 job"              if job.count == 1
    "are #{job.count} jobs"
  end
end
