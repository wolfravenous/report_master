class Unit < ActiveRecord::Base
  # Associations
  belongs_to :subject

  # Validations
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
