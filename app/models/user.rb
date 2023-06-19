class User < ApplicationRecord
  include Geteable
  # include Scrapable
  # has_many :repos
  # after_create_commit :update_user_github
  #
  def back_up_save(information)
    return if time_to_update?

    self.update(information: information)
  end
  #
  # def update_user
  #   update_user_github #if time_to_update?
  #
  #   self.information
  # end
  #
  def time_to_update?
    Time.now - self.updated_at >= 23.hours
  end
end
