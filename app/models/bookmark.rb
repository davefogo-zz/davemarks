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

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |bookmark|
        csv << bookmark.attributes.values_at(*column_names)
      end
    end
  end
end
