# SmartMaths4Kids 🎓🧮

**SmartMaths4Kids** is a fun and interactive web-based learning platform designed for children aged 5 to 12.  
It offers quizzes, challenges, and certificates to make learning math enjoyable and rewarding.

## Features ✨
- User registration and login system (with Devise)
- Multiple quiz categories: Numbers, Addition, Subtraction, Multiplication, Division
- Unique challenges: Magic Square Puzzle & Magic Mind Reader
- Instant feedback with score and percentage calculation
- Personalized PDF certificates after quiz completion
- Admin panel to manage questions and scores
- Visual results with pie charts using Chartkick + Chart.js
- Fully responsive interface (Bootstrap 5)

## Technologies Used 🛠️
- Ruby on Rails 7.1
- PostgreSQL
- Bootstrap 5
- Chartkick + Chart.js
- Devise for authentication
- Prawn or WickedPDF for certificate generation

## Installation 🚀

To run the project locally:

```bash
git clone https://github.com/Ahmad-Bourhan/SmartMaths4Kids.git
cd SmartMaths4Kids
bundle install
rails db:create
rails db:migrate
rails server
