require 'uri'

class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  validates :url, :url => true

  validates_uniqueness_of :url, scope: :user_id

  belongs_to :user
end
