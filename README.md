# GITHUB PROFILE TEMPLATE

## Objectives

- Streamline the process of updating your portfolio
- Implement automatic updates based on the time of visit
- Establish a standardized README template
- Easily pin your preferred repositories and the scrapper will do the work for you


## Description of the Project

For the development of the project, the following tools were used:

- Rails v 7.0.5
- Ruby 3.2.0
- Postgresql
- Github API
- Helloacm API

The purpose of this project is to reduce the time required to update your portfolio with new repositories and details. 
This can be easily achieved by writing a well-structured README and having the app to read it, and also pin your most outstanding repos.

## How to start the project from your Local environment
- On production it is needed to create an .env file
````
GITHUB_USER=your_git_hub_nickname
GOOGLE_CV=link_of_your_cv_I_USE_GOOGLE_DOCS
````
- Your pinned projects need to have this kind README template, scrapper will stop at 'Description of the Project'

- Open your terminal and cd where you want to store the project
- Run the following command in the terminal
```bash
git clone https://github.com/Wusinho/template_portfolio.git
```
- Cd into the created directory
- Run $ `bundle install`
- On terminal type $ `rails db:create && rails db:migrate`
- On terminal type $ `rails server`

## Author

👤 **Heber Lazo**

- Github: [@Wusinho](https://github.com/Wusinho)
- LinkedIn: [Heber Lazo](https://www.linkedin.com/in/heber-lazo-benza-523266133/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a star if you :star: like this project!

