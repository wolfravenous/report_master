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
  validates :unit_id, presence: true, :allow_nil => true
  validates :initial_id, presence: true, :allow_nil => true
  validates :ending_id, presence: true, :allow_nil => true
  validates :future_id, presence: true, :allow_nil => true
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
    honor == true ? "To provide Honors supplement to NAME, heshe was challenged to work to develop a deeper understanding of the course material.  NAME also served as a peer tutor and assisted other students to achieve success in class." : ""
  end

  def genderized_honor_comment
    honor_comment.gsub(/HESHE/, heshe_pronoun.capitalize).gsub(/heshe/, heshe_pronoun).gsub(/HIMHER/, himher_pronoun.capitalize).gsub(/himher/, himher_pronoun).gsub(/HISHER/, hisher_pronoun.capitalize).gsub(/hisher/, hisher_pronoun).gsub(/HSHS/, hshs_pronoun.capitalize).gsub(/hshs/, hshs_pronoun).gsub(/NAME/, self.name)
  end

  def accel_comment
    accel == true ? "In order to allow NAME to move through the course in an accelerated manner heshe received a heavier and concentrated work load to complete the course material in an abbreviated time." : ""
  end

  def genderized_accel_comment
    accel_comment.gsub(/HESHE/, heshe_pronoun.capitalize).gsub(/heshe/, heshe_pronoun).gsub(/HIMHER/, himher_pronoun.capitalize).gsub(/himher/, himher_pronoun).gsub(/HISHER/, hisher_pronoun.capitalize).gsub(/hisher/, hisher_pronoun).gsub(/HSHS/, hshs_pronoun.capitalize).gsub(/hshs/, hshs_pronoun).gsub(/NAME/, self.name)
  end

  def maxonline_comment
    maxonline == true ? "NAME is encouraged to maximize hisher scores on online assignments when heshe is given the opportunity for multiple attempts." : ""
  end

  def genderized_maxonline_comment
    maxonline_comment.gsub(/HESHE/, heshe_pronoun.capitalize).gsub(/heshe/, heshe_pronoun).gsub(/HIMHER/, himher_pronoun.capitalize).gsub(/himher/, himher_pronoun).gsub(/HISHER/, hisher_pronoun.capitalize).gsub(/hisher/, hisher_pronoun).gsub(/HSHS/, hshs_pronoun.capitalize).gsub(/hshs/, hshs_pronoun).gsub(/NAME/, self.name)
  end

  def grade_descrip
    average = true ? "Students are evaluated for a grade based on three weighted areas.  The first is classwork/homework.  This category is composed of both written and online work completed in the classroom and outside of class.  This work is weighted as fifty percent of the overall grade. The second area of evaluation is assessments.  This category is representative of interactive online and written assessments that the students complete following class work on a topic.  The assessment category is weighted as thirty percent of the overall grade.  The final category of evaluation is participation and discussion in class labs and demonstrations.  This is weighted as the remaining twenty percent of the overall grade. These percentage breakdowns are included so that students can see what areas they are doing well in and focus to strengthen those areas in which their scores may be weaker." : ""
  end

  def average_rev
    average > 0 ? (average > 1 ? average : "NA") : "NC"
  end

  def classwork_rev
    self.classwork > 0 ? (self.classwork > 1 ? self.classwork.to_i : "NA") : "NC"
  end

  def assessment_rev
    self.assessment > 0 ? (self.assessment > 1 ? self.assessment.to_i : "NA") : "NC"
  end

  def participate_rev
    self.participate > 0 ? (self.participate > 1 ? self.participate.to_i : "NA") : "NC"
  end


end
