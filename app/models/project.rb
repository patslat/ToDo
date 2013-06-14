class Project < ActiveRecord::Base
  attr_accessible :completion, :description, :title,
                  :items_attributes, :team_id
  has_many :items, :inverse_of => :project, :dependent => :destroy
  belongs_to :team

  accepts_nested_attributes_for :items,
    :reject_if => lambda { |attributes|
                          attributes[:title].blank? &&
                          attributes[:description].blank?
  }

end