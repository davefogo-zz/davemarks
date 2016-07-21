class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates :url, length: {minimum: 3}, presence: true
  has_many :likes, dependent: :destroy

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Bookmark.create! row.to_hash
    end
  end
end
