class User < ApplicationRecord
  include Geteable
  # include Scrapable
  # has_many :repos
  # after_create_commit :update_user_github
  #
  # def update_user_github
  #   self.update(information: self.git_hub_info)
  #   self.scrape
  # end
  #
  # def update_user
  #   update_user_github #if time_to_update?
  #
  #   self.information
  # end
  #
  # def time_to_update?
  #   Time.now - self.updated_at >= 23.hours
  # end
end
