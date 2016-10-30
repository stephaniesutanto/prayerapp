class Group < ActiveRecord::Base
  has_many :memberships
  belongs_to :user
  has_many :users, -> { distinct }, through: :memberships
  has_many :prayers, through: :prayer_groups
  has_many :prayer_groups
  has_many :invites
end
