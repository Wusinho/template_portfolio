require 'uri'

class Repo < ApplicationRecord
  belongs_to :user

  def repo_info
    url = "https://raw.githubusercontent.com/#{ENV['GITHUB_USER']}/#{name}/master/README.md"
    response = Faraday.get(url)
    #
    doc = Nokogiri::HTML(response.body)
    # mark_down_readme = ers(doc.text

    # mark_down_readme = "# Mailing System\n\n# Objectives\n\n- The email and user preferences must be stored in Database.\n- The same email cannot be registered twice, an error message will be displayed to the user indicating that the email already exists.\n- Make a simple validation of the user's input to guarantee that what they have entered complies with the valid format of an email.\n- The user may select one or more preferences, but they must select at least one of them.\n- Once the user has been registered successfully, an email will be sent confirming their subscription.\n\nExtra Ball 1:\n\n- Even if the email has a valid format, that does not mean that it is an existing email. It could be that the domain does not exist, or it is not configured to receive mail. To prevent submitting this type of emails, we will only accept those that obtain a score greater than 0.7 when looking up in this API:\n\nExtra Ball 2:\n\n- The landing page will be used in several countries, therefore it should be prepared to adapt it to three different languages. This is what we know in software development as internationalization (i18n).\n\n- It is not necessary to translate the texts to other languages, but the project must be prepared to be easily localized without needing to make changes to the code (through a file containing the translations, for example).\n\nExtra Ball 3 (Optional):\n\n- After successfully registering the subscriber's email and preferences, the user will be able to answer a survey to obtain a discount coupon. The survey can be a multi-step form of 3-5 questions.\n\n# Description of the Project\n\nFor the development of the project, the following tools were used:\n\n- Rails v 7.0.4\n- Ruby 3.2.0\n- Postgresql\n- Bootstrap v 5.1.3\n\nThe purpose of the exercise is to build a landing page with a functional newsletter submission. \nAfter a user subscribes to the mailer, a message will be sent. There are 2 options to fill in the survey\nfrom the actual landing_page, and through a link in the mail.\n\n### Additional details\n\nTo enhance the functionality of the question model, we can introduce an association called question_category and incorporate an additional model called category. This modification will allow us to utilize tags, enabling questions to be easily searchable and reusable for other surveys.\n\nFurthermore, we can consider transforming the Survey model into a polymorphic table. This adjustment will provide greater flexibility and adaptability, allowing for more diverse types of surveys to be created and managed efficiently.\n\nBy implementing these enhancements, we can elevate the professionalism and effectiveness of the survey system, empowering users with advanced features and improved usability.\n\n\n![image](./app/assets/images/landing_page.png)\n\n\n### **Endpoints of API**\n\n| Method | Endpoint    |               Functionality |\n|--------| ----------- |----------------------------:|\n| GET    | home        |                 Lading Page |\n| POST   | subscriptions |        Create subscriptions |\n| GET    | surveys |                 Show Survey |\n| POST   | surveys | Create Survey and Questions |\n| PATCH  | surveys |      Update Survey Answer's |\n\n## How to start the project from your Local environment\n- For the validation API email validation to work, you need to put your own API KEY on:\n[validatetable.rb](./app/models/concerns/validatetable.rb)\n\n- Open your terminal and cd where you want to store the project\n- Run the following command in the terminal\n```bash\ngit clone https://github.com/Wusinho/mailing_test.git\n```\n- Cd into the created directory\n- Run $ `bundle install`\n- On terminal type $ `rails db:create && rails db:migrate && rails db:seed`\n- On terminal type $ `rails server`\n\n## Author\n\n👤 **Heber Lazo**\n\n- Github: [@Wusinho](https://github.com/Wusinho)\n- LinkedIn: [Heber Lazo](https://www.linkedin.com/in/heber-lazo-benza-523266133/)\n\n## 🤝 Contributing\n\nContributions, issues, and feature requests are welcome!\n\n## Show your support\n\nGive a star if you :star: like this project!\n\n"
    removed_unnecessary_readme = extract_description(doc.text)
    encoded_uri = URI.encode_www_form_component(removed_unnecessary_readme)
    #
    api_url = "https://helloacm.com/api/markdown/?cached&s=#{encoded_uri}"
    #
    resp = Faraday.get(api_url)
    resp.body


  end

  def sanitize_characters(string)
    string.gsub("\n", " ")
  end

  def encode_uri(uri)
    URI.encode(uri)
  end

  def extract_description(mark_down_readme)
    end_point_index = mark_down_readme.index('### **Endpoints of API**')
    description = end_point_index.nil? ? mark_down_readme : mark_down_readme[0...end_point_index]
    description.strip
  end



end
