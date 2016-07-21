class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, length: {minimum: 3}, presence: true
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Topic.create! row.to_hash
    end
  end
end
