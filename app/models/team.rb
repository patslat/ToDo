class Team < ActiveRecord::Base
  attr_accessible :name
  has_many :team_memberships
  has_many :teammates,
           :through => :team_memberships,
           :source => :member
end
