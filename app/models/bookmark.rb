class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates :url, length: {minimum: 3}, presence: true
end
