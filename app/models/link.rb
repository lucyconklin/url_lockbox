require 'uri'

class Link < ActiveRecord::Base
  validate :url_is_valid
  validates :url, presence: true
  validates :url, uniqueness: true
  validates :title, presence: true

  belongs_to :user

  def url_is_valid
    url = url || ''
    if URI::parse(url).host != nil
      return true
    else
      errors.add(:url, "is invalid")
    end
  end
end
