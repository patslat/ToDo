class Project < ActiveRecord::Base
  attr_accessible :completion, :description, :title, :items_attributes
  has_many :items
  belongs_to :team

  accepts_nested_attributes_for :items,
    :reject_if => lambda { |attributes|
                          attributes.title.nil? &&
                          attributes.description.nil?
  }

end