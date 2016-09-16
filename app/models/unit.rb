class Unit < ActiveRecord::Base
  # Associations
  belongs_to :subject
  has_many  :reports
  
  # Validations
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
