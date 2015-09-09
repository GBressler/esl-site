class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_many :collaborations
  has_many :collaborators, through: :collaborations,
  source: :user

  validates_presence_of :title, :content
end
