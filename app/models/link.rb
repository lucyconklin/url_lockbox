require 'uri'

class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  validates :url, :url => true

  # validate :url_is_valid
  validates_uniqueness_of :url, scope: :user_id

  belongs_to :user

  # def url_is_valid
  #   url ||= ' '
  #   encoded_url = url.gsub(' ','%20')
  #   if URI::parse(encoded_url).host != nil
  #     return true
  #   else
  #     errors.add(:url, "is invalid")
  #   end
  # end
end
