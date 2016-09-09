class Report < ActiveRecord::Base

  # Associations
  belongs_to :subject

  # Validations
  validates :name, presence: true
  validates :comment, presence: true
  validates :gender, presence: true
  validates :subject_id, presence: true
  validates :classwork, presence: true
  validates :assessment, presence: true
  validates :participate, presence: true


  # Callbacks
  def average
    (self.classwork.to_f * 0.5) + (self.assessment.to_f * 0.3) + (self.participate.to_f * 0.2)
  end

end
