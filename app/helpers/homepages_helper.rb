module HomepagesHelper
  def name_list(name)
    names = []
    20.times { names << Faker::Name.name }
    names << name
  end
end
