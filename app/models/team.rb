class Team < ActiveRecord::Base
  attr_accessible :name, :teammate_ids

  has_many :team_memberships
  has_many :teammates,
           :through => :team_memberships,
           :source => :member
  has_many :projects
end
