require 'uri'

class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  validates :url, :url => true

  validates_uniqueness_of :url, scope: :user_id

  belongs_to :user

  def self.assign_top_link
    links = self.find_by(popularity: "top-link")
    if links != nil
      links.update_attributes(popularity: 'none')
    end
    hot_read = HotRead.current_top_link
    Link.find_by(url: hot_read.url).update_attributes(popularity: 'top_link')
  end

  def self.assign_hot_reads
    links = self.find_by(popularity: "hot_read")
    if links != nil
      links.update_attributes(popularity: 'none')
    end
    HotRead.current_hotreads.each do |hot_read|
      Link.find_by(url: hot_read.url).update_attributes(popularity: 'hot_read')
    end
  end
end
