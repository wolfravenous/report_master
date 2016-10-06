class Report < ActiveRecord::Base

  # Associations
  belongs_to :subject
  belongs_to :unit
  belongs_to :intro
  # accepts_nested_attributes_for :intro
  belongs_to :future

  belongs_to :initial, class_name: "Unit"
  belongs_to :ending, class_name: "Unit"

  # Validations
  validates :name, presence: true
  validates :comment, presence: true
  validates :gender, presence: true
  validates :subject_id, presence: true
  validates :intro_id, presence: true
  # validates :unit_id, presence: true
  validates :initial_id, presence: true
  validates :ending_id, presence: true
  validates :future_id, presence: true
  validates :classwork, presence: true
  validates :assessment, presence: true
  validates :participate, presence: true


  # Functions
  def favg
    (self.classwork.to_f * 0.5) + (self.assessment.to_f * 0.3) + (self.participate.to_f * 0.2) + (0.5)
  end

  def average
    favg.to_i
  end

  def unit_array
    x = self.initial_id
    y = self.ending_id
    array = Unit.where(id: x..y).pluck(:content).join("\n\n")
  end



  def genderized_unit_array
    unit_array.gsub(/HESHE/, heshe_pronoun.capitalize).gsub(/heshe/, heshe_pronoun).gsub(/HIMHER/, himher_pronoun.capitalize).gsub(/himher/, himher_pronoun).gsub(/HISHER/, hisher_pronoun.capitalize).gsub(/hisher/, hisher_pronoun).gsub(/HSHS/, hshs_pronoun.capitalize).gsub(/hshs/, hshs_pronoun).gsub(/NAME/, self.name)
  end



  def heshe_pronoun
    gender == 'female' ? 'she' : 'he'
  end
  def himher_pronoun
    gender == 'female' ? 'her' : 'him'
  end
  def hisher_pronoun
    gender == 'female' ? 'her' : 'his'
  end
  def hshs_pronoun
    gender == 'female' ? 'herself' : 'himself'
  end

  def genderized_comment
    comment.gsub(/HESHE/, heshe_pronoun.capitalize).gsub(/heshe/, heshe_pronoun).gsub(/HIMHER/, himher_pronoun.capitalize).gsub(/himher/, himher_pronoun).gsub(/HISHER/, hisher_pronoun.capitalize).gsub(/hisher/, hisher_pronoun).gsub(/HSHS/, hshs_pronoun.capitalize).gsub(/hshs/, hshs_pronoun).gsub(/NAME/, self.name)
  end

  def genderized_intro
    intro.content.gsub(/HESHE/, heshe_pronoun.capitalize).gsub(/heshe/, heshe_pronoun).gsub(/HIMHER/, himher_pronoun.capitalize).gsub(/himher/, himher_pronoun).gsub(/HISHER/, hisher_pronoun.capitalize).gsub(/hisher/, hisher_pronoun).gsub(/HSHS/, hshs_pronoun.capitalize).gsub(/hshs/, hshs_pronoun).gsub(/NAME/, self.name)
  end

  def genderized_future
    future.content.gsub(/HESHE/, heshe_pronoun.capitalize).gsub(/heshe/, heshe_pronoun).gsub(/HIMHER/, himher_pronoun.capitalize).gsub(/himher/, himher_pronoun).gsub(/HISHER/, hisher_pronoun.capitalize).gsub(/hisher/, hisher_pronoun).gsub(/HSHS/, hshs_pronoun.capitalize).gsub(/hshs/, hshs_pronoun).gsub(/NAME/, self.name)
  end


  def honor_comment
    honor == true ? "Some NAME Comment here about hisher work at the honors level. \n" : ""
  end

  def genderized_honor_comment
    honor_comment.gsub(/HESHE/, heshe_pronoun.capitalize).gsub(/heshe/, heshe_pronoun).gsub(/HIMHER/, himher_pronoun.capitalize).gsub(/himher/, himher_pronoun).gsub(/HISHER/, hisher_pronoun.capitalize).gsub(/hisher/, hisher_pronoun).gsub(/HSHS/, hshs_pronoun.capitalize).gsub(/hshs/, hshs_pronoun).gsub(/NAME/, self.name)
  end



end
