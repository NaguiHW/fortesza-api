# Graphql API with Devise authentication

This is a simple example of a Graphql API with Devise authentication.

## Requirements
This is based in the following requirements:
- Ruby 3.2.2
- Rails 7.0.7

## Remember
- Generate your own `master.key` and `credentials.yml.enc`
```bash
rails credentails:edit
```
- In `credentials.yml.enc` add your own `secret_key_base` and `devise_jwt_secret_key`
```bash
EDITOR="code --wait" rails credentials:edit
```

## Setup

```bash
bundle install
rails db:create db:migrate
rails s
```
