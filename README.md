<p align="center">
  <img src="https://img.shields.io/badge/Microverse-blueviolet">
</p>

#  Microverse Ruby On Rails Life Style Magazine Capstone
> For this project, I built an entire app from scratch with Ruby on Rails. The app is based off of a life style article website. The theme of the site is electric cars. The app allows users to create accounts, login, create small articles, and cast votes for specific articles. The Article with the most votes becomes the featured article with full-width image and title in the first row of the page. The second row of the page displays the most recent articles written for a particular category.

## Built With

- Ruby v2.7.2
- Ruby on Rails v6.1.3

## Live Demo

[Microverse Ruby On Rails Life Style Magazine Capstone](https://salty-sea-17849.herokuapp.com/)

## Video Link
[Link To Video Presentation of the App](https://www.loom.com/share/e6bfa670c057452ab8db14bd2432e551)

## App Screenshot

<img src="/public/Screenshot(15).png">

## Getting Started

Follow these simple steps to get the app working.
### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: 9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
   rails db:seed
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.
When creating and article, please input a valid url for an image. 

### Run tests

```
    rpsec --format documentation
```

## Author

👤 **Paul Clue**

- GitHub: [@PaulClue](https://github.com/Paul-Clue)
- LinkedIn: [Paul Clue](https://www.linkedin.com/in/paul-clue/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Paul-Clue/rails-lifestyle-magazine-capstone/issues).

## Show your support

Give a ⭐️ if you like this project!


## 📝 License

MIT License

Copyright (c) 2021 Paul Clue

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
