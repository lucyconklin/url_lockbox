require 'uri'

class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  validates :url, :url => true

  validates_uniqueness_of :url, scope: :user_id

  belongs_to :user

  def self.current_top_link_id
    self.order(read_count: :desc).limit(1).pluck(:id)[0]
  end

  def self.current_hotlink_ids
    self.order(read_count: :desc).limit(10).pluck(:id)
  end

  def self.current_hotlinks
    self.order(read_count: :desc).limit(10)
  end
end
