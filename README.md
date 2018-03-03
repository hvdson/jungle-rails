# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Features
<strong>Sold Out Badge:</strong>

* displays when item quantity is < 0 and removes ability to add to cart*

<h4>Admin Categories</h4>

* Admin users can list and create new categories
* Admins can add new products using the new category

<h4>User Authentication</h4>

- Sign up is located in the nav bar so users are able to access the register page from anywhere in the website
- sign up with email,password, first & last name 
- login with email and password info

<h4>Enhancement: Order Details Page </h4>

- The order page contains items, their image, name, description, quantities and line item totals
- The final amount for the order is displayed

<h4>Email Receipt</h4>
- order ID in subject line and has order details sent in HTML format

<h2>Bug Fixes</h2>

<h4>Admin Security</h4>
- Basic HTTP auth implemented to only allow admins access to the admin options (Product, category, dashboard) in the admin dropdown menu

<h4>Checking out with empty cart</h4>
- when the cart is empty and user goes to the cart page, a message is displayed with a link to the login page. Modularized the ruby way with use of partials and newly defined helper method

<h4>Product Rating</h4>
- Visitors are able to view product ratings by other users. People logged in are able to make new reviews. Users are also able to delete their own review for a specific product.

<h2>Screenshots</h2>
!["Home Page"](https://github.com/hvdson/jungle-rails/blob/master/docs/home.png)

!["Home Page"](https://github.com/hvdson/jungle-rails/blob/master/docs/signup.png)

!["Home Page"](https://github.com/hvdson/jungle-rails/blob/master/docs/login.png)

!["Home Page"](https://github.com/hvdson/jungle-rails/blob/master/docs/admin_login.png)

!["Home Page"](https://github.com/hvdson/jungle-rails/blob/master/docs/admin_categories.png)

!["Home Page"](https://github.com/hvdson/jungle-rails/blob/master/docs/product.png)

!["Home Page"](https://github.com/hvdson/jungle-rails/blob/master/docs/new_review.png)

!["Home Page"](https://github.com/hvdson/jungle-rails/blob/master/docs/show_new_review.png)

!["Home Page"](https://github.com/hvdson/jungle-rails/blob/master/docs/delete_review.png)

