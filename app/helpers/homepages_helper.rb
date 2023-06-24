module HomepagesHelper
  def name_list(name)
    names = []
    10.times { names << Faker::Name.name }
    names << name
  end

  def recruiters_list
    [
      'Programming Languages',
      'Object-Oriented Programming',
      'Agile Methodologies',
      'Web Development',
      'Mobile Development',
      'Database Management',
      'API Integration',
      'Version Control Systems',
      'Test-Driven Development (TDD)',
      'Debugging and Troubleshooting',
      'Front-End Development',
      'Back-End Development',
      'Full-Stack Development',
      'User Experience (UX) Design',
      'Software Documentation',
      'Project Management',
      'Problem-Solving Skills',
      'Communication and Collaboration',
      'Software Development Tools',
      'Continuous Learning and Adaptability',
      'AWS',
      'Testing'
    ]
  end

  def cta
    'cta'
  end
end
