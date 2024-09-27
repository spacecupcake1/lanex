# Lanex

## Overview

This project is an multi-user application website for language exchange Programm. It is built using Ruby on Rails.

## Getting Started

Follow these steps to get the application up and running:

### 1. Clone the repository

```sh
git clone https://github.com/spacecupcake1/lanex.git
cd main
```

### 2. Install dependencies

```sh
bundle install
```

### 3. Set up the database

```sh
rails db:create
rails db:migrate
```

### 4. Precompile assets

```sh
rails assets:precompile
```
### 5. Start the server

```sh
rails server
```
Visit http://localhost:3000 in your browser to see the application running.

### Running Tests

```sh
rails test
```

### Optional: Inboxes

To see the inboxes in the browser, go to: http://localhost:3000/letter_opener

