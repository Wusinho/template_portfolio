require 'uri'

class Repo < ApplicationRecord
  belongs_to :user
end
