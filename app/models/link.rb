require 'uri'

class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  # validate :url_is_valid
  validates :url, uniqueness: true

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
