class Bookmark < ActiveRecord::Base
  belongs_to :topic
  validates :url, length: {minimum: 3}, presence: true
end
