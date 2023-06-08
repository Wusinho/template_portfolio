module HomepagesHelper
  def name_list(name)
    names = []
    10.times { names << Faker::Name.name }
    names << name
  end

  def cta
    'cta'
  end
end
