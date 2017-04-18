class HotRead < ActiveRecord::Base
  validates :url, presence: true

  def self.current_hotreads
    self.order(count: :desc).limit(10)
  end
end
