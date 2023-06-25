module HomepagesHelper
  def name_list(name)
    names = []
    10.times { names << Faker::Name.name }
    names << name
  end

  def recruiters_list
    [
      'JavaScript',
      'React',
      'Redux',
      'Ruby',
      'Rails',
      'HTML',
      'CSS',
      'Agile',
      'Web',
      'Mobile',
      'Database Management',
      'API Integration',
      'Git',
      'TDD',
      'Debugging',
      'Front-End',
      'Back-End',
      'Full-Stack',
      'Documentation',
      'Project Management',
      'Problem-Solving',
      'Communication',
      'Collaboration',
      'Continuous Integration',
      'Adaptability',
      'AWS',
      'Testing'
    ]
  end


  def cta
    'cta'
  end
end
