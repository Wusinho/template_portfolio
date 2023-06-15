class User < ApplicationRecord
  include Geteable
  include Scrapable
  has_many :repos

  def self.create_update_profile
    user = find_or_create_by(id: 1)
    if user.information.nil? || user.update_time
      user.update(information: user.git_hub_info)
      user.scrape
    end
    user
  end

  def update_time
    Time.now - self.updated_at >= 23.hours
  end
end
