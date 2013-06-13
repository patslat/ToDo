class Item < ActiveRecord::Base
  attr_accessible :completion, :description, :title
  belongs_to :project
end
