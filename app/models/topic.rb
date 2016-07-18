class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, length: {minimum: 3}, presence: true

end
