class User < ApplicationRecord
  include Geteable

  def self.create_update_profile
    user = find_or_create_by(id: 1)
    if user.information.nil? || Time.now > user.updated_at + 1.hour
      user.update(information: user.git_hub_info)
    end
    user
  end
end
