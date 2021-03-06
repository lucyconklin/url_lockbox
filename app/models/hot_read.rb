class HotRead < ActiveRecord::Base
  validates :url, presence: true

  def self.current_hotreads
    self.order(count: :desc).limit(10)
  end

  def self.current_top_link
    self.order(count: :desc).limit(1)[0]
  end

  def update
    count = Link.where(url: url).pluck(:read_count).reduce(:+)
  end
end
