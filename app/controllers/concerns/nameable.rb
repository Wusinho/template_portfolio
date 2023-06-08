module Nameable
  extend ActiveSupport::Concern

  def name_list(name)
    names = []
    80.times { names << Faker::Name.name }
    names << name
  end


end