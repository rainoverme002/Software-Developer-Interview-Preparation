# Better Ruby on Rails Cheatsheet

## Getting Started

This is my Ruby on Rails Developer To Be repo.
Could be as a reference for someone want to know how Ruby on Rails work

### Prerequisites

What things you need to use it

```
1. rbenv
2. ruby 2.5.1
```

## Authors

[rainoverme002](https://github.com/rainoverme002)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks for all of my teammate in Mekari

## Quotes of the Day

* Stay learning and you will get what you want

## Basic Principle

Always Encapsulation (Different Repo if it’s very big app):

- Database Layer
- Application Layer
- Business Layer
- View Layer

Always write the business logic inside the private method (model)

Always use English and readable name for public method

Public method always call the private method and don’t care about code implementation but care about code integrity

Private method doesn't need testing (spec), just test the public method that call the private method

In MVC (Model: business logic place, View: Cannot hit db, Controller: Call model method and give it to view)

In Database Architecture, there are master DB and replica db(slave). For better performance we write in master DB and read from replica db(slave)

In Services, the service itself doesn't return anything and just call to perform something
serviceObject.perform
serviceObject.result

## Architecture

![rails_architecture](https://raw.githubusercontent.com/mdang/resources/master/ruby/rails/rails_architecture.png)

### RVM

`$ rvm list` - show currently installed Rubies

`$ rvm install 2.3.1`

`$ rvm use --default 2.3.1` - use most recent

### rbenv

`$ rbenv install -l` - List all available versions

`$ rbenv install 2.2.1` - Install Ruby 2.2.1

`$ rbenv uninstall 2.2.1` - Uninstall Ruby 2.2.1

`$ rbenv versions` - See installed versions

`$ rbenv version` - See current version

`$ rbenv which <NAME>` - Display path to executable

`$ rbenv rehash` - Re-write binstubs

`$ rbenv local 2.2.2` - Use Ruby 2.2.2 in project

`$ rbenv local --unset` - Undo above

`$ rbenv global 2.2.2` - Use Ruby 2.2.2 globally

`$ rbenv global --unset` - Undo above

`$ rbenv shell 2.2.2` - Use Ruby 2.2.2 in shell

`$ rbenv shell --unset` - Undo above

### Create a new application

Install the Rails gem if you haven't done so before

```ruby
gem install rails
```

Generate a new Rails app w/ Postgres support

```ruby
bin/rails new my_app --database=postgresql
```

Initialize the database

```ruby
bin/rails db:create
```

Start the Rails server

```ruby
bin/rails s
```

### Console/debugging

Add this to any view to enable a Rails console in the browser:

`<% console %>`

Use the interactive Rails console in your terminal application to run Rails code, inspect your database etc.

`$ bin/rails console`

E.g. try out the pluralize helper:

`> helper.pluralize(3, 'mouse')`

`> helper.number_to_currency(1.50)`

`> helper.truncate("Iron Man", length: 7)`

[All Rails Helpers available here](https://jasoncharnes.com/rails-helpers/)

Open the DB Console, from which you can interact with your database using your database's regular commands:

`$ bin/rails dbconsole`

Show environment variables:

`$ env`

### Routes

Create a route that maps a URL to the controller action

```rb
# config/routes.rb
get 'welcome' => 'pages#home'
```

Shorthand for connecting a route to a controller/action

```rb
# config/routes.rb
get 'photos/show'

# The above is the same as:
get 'photos/show', :to 'photos#show'
get 'photos/show' => 'photos#show'
```

Automagically create all the routes for a RESTful resource

```ruby
# config/routes.rb
resources :photos
```

![route](https://cloud.githubusercontent.com/assets/25366/8561247/75b73966-24d7-11e5-896a-06506648c4fe.png)

| HTTP Verb | Path             | Controller#Action | Used for                                     |
| --------- | ---------------- | ----------------- | -------------------------------------------- |
| GET       | /photos          | photos#index      | display a list of all photos                 |
| GET       | /photos_new      | photos#new        | return an HTML form for creating a new photo |
| POST      | /photos          | photos#create     | create a new photo                           |
| GET       | /photos/:id      | photos#show       | display a specific photo                     |
| GET       | /photos/:id/edit | photos#edit       | return an HTML form for editing a photo      |
| PATCH/PUT | /photos/:id      | photos#update     | update a specific photo                      |
| DELETE    | /photos/:id      | photos#destroy    | delete a specific photo                      |

Create resources for only certain actions

```rb
# config/routes.rb
resources :photos, :only => [:index]

# On the flip side, you can create a resource with exceptions
resources :photos, :except => [:new, :create, :edit, :update, :show, :destroy]
```

Create a route to a static view, without an action in the controller

```rb
# config/routes.rb
# If there's a file called 'about.html.erb' in 'app/views/photos', this file will be
#   automatically rendered when you call localhost:3000/photos/about
get 'photos/about', to: 'photos#about'
```

Reference: <http://guides.rubyonrails.org/routing.html>

### Controllers

Generate a new controller

**Note:** Name controllers in Pascal case and pluralize

``` ruby
bin/rails g controller Photos
```

Generate a new controller with default actions, routes and views

``` ruby
bin/rails g controller Photos index show
```

### Database Querying

[Active Record Finder Methods](http://api.rubyonrails.org/classes/ActiveRecord/FinderMethods.html)

[Active Record Querying](http://guides.rubyonrails.org/active_record_querying.html)

| Rails code         | Returns                    |
| ------------------ | -------------------------- |
| User.all           | `[array of all users]`     |
| User.find(1)       | User with primary key of 1 |
| User.find([1, 10]) | Users 1 and 10             |

Reference: <http://guides.rubyonrails.org/action_controller_overview.html>

### Models

Generate a model and create a migration for the table

**Note:** Name models in Pascal case and singular

``` ruby
rails g model Photo
```

Generate a model and create a migration with table columns

``` ruby
rails g model Photo path:string caption:text
```

The migration automatically created for the above command:

``` ruby
class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :path
      t.text :caption

      t.timestamps null: false
    end
  end
end
```

Reference: <http://guides.rubyonrails.org/active_model_basics.html>

### Migrations

Migration Data Types

- `:boolean`
- `:date`
- `:datetime`
- `:decimal`
- `:float`
- `:integer`
- `:primary_key`
- `:references`
- `:string`
- `:text`
- `:time`
- `:timestamp`

When the name of the migration follows the format `AddXXXToYYY` followed by a list of columns, it will add those columns to the existing table

``` ruby
rails g migration AddDateTakenToPhotos date_taken:datetime
```

The above creates the following migration:

``` ruby
class AddDateTakenToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :date_taken, :datetime
  end
end
```

You can also add a new column to a table with an index

``` ruby
rails g migration AddDateTakenToPhotos date_taken:datetime:index
```

The above command generates the following migration:

``` ruby
class AddDateTakenToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :date_taken, :datetime
    add_index :photos, :date_taken
  end
end
```

The opposite goes for migration names following the format: `RemoveXXXFromYYY`

``` ruby
rails g migration RemoveDateTakenFromPhotos date_taken:datetime
```

The above generates the following migration:

``` ruby
class RemoveDateTakenFromPhotos < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :date_taken, :datetime
  end
end
```

### Scaffolding

Scaffolding is great for prototypes but don't rely too heavily on it: <http://stackoverflow.com/a/25140503>

``` ruby
rails g scaffold Photo path:string caption:text
rake db:migrate
```

### Associations

[Rails Association Basics](http://guides.rubyonrails.org/association_basics.html)

#### has_many & belongs_to

One book belongs to an author. An author has many books.

`belongs_to` creates an `author_id` column in the table.

```ruby
# Models:

class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end

class Book < ApplicationRecord
  belongs_to :author
end
```

The corresponding migration might look like this:

```ruby
class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end

    create_table :books do |t|
      t.belongs_to :author, index: true
      t.datetime :published_at
      t.timestamps
    end
  end
end
```

##### has_one

One CEO has one company. There is no need to declare that the company belongs_to the Ceo - this is obvious.

In this case, has_one creates a foreign key of ceo_id on on the company model (as though the company has been declared to `belong_to` a Ceo)

```ruby
# Model

class Ceo < ApplicationRecord
  has_one :company
end

# Migration

class CreateCeo < ActiveRecord::Migration[5.0]
  def change
    create_table :ceos do |t|
      t.string :name
      t.timestamps
    end

    create_table :company do |t|
      t.belongs_to :ceo, index: true
      t.string :name
      t.timestamps
    end
  end
end
```

### Seeding

Seeding can be done in `seed.rb` or on the Rails console.

Delete record to avoid duplication:

`Gallery.delete_all`

Creating records that have relationships:

`area_show = Gallery.create(title: 'Area Show, May 2016')`

Images belong to a gallery:

`area_show.images << Image.new(path: "gallery_photos/pic1.jpg")`

### All DB Commands

e.g.

`$ bin/rails db:create`

from [jacopretorius.net](https://jacopretorius.net/2014/02/all-rails-db-rake-tasks-and-what-they-do.html)

- _db:create_ Creates the database for the current RAILS_ENV environment. If RAILS_ENV is not specified it defaults to the development and test databases.

- _db:create:all_ Creates the database for all environments.

- _db:drop_ Drops the database for the current RAILS_ENV environment. If RAILS_ENV is not specified it defaults to the development and test databases.

- _db:drop:all_ Drops the database for all environments.

- _db:migrate_ Runs migrations for the current environment that have not run yet. By default it will run migrations only in the development environment.

- _db:migrate:redo_ Runs db:migrate:down and db:migrate:up or db:migrate:rollback and db:migrate:migrate depending on the specified migration. I usually run this after creating and running a new migration to ensure the migration is reversable.

- _db:migrate:up_ Runs the up for the given migration VERSION.

- _db:migrate:down_ Runs the down for the given migration VERSION.

- _db:migrate:status_ Displays the current migration status.

- _db:migrate:rollback_ Rolls back the last migration.

- _db:version_ Prints the current schema version.

- _db:forward_ Pushes the schema to the next version.

- _db:seed_ Runs the db/seeds.rb file.

- _db:schema:load_ Loads the schema into the current environment’s database.

- _db:schema:dump_ Dumps the current environment’s schema to db/schema.rb.

- _db:setup_ Runs db:create, db:schema:load and db:seed.

- _db:reset_ Runs db:drop and db:setup.

- _db:migrate:reset_ Runs db:drop, db:create and db:migrate.

- _db:test:prepare_ Check for pending migrations and load the test schema. (If you run rake without any arguments it will do this by default.)

- _db:test:clone_ Recreate the test database from the current environment’s database schema.

- _db:test:clone_structure_ Similar to db:test:clone, but it will ensure that your test database has the same structure, including charsets and collations, as your current environment’s database.

### Path Helpers

Creating a path helper for a route

```rb
# Creating a path helper for a route
get '/photos/:id', to: 'photos#show', as: 'photo'
```

```rb
# app/controllers/photos_controller.rb
@photo = Photo.find(17)
```

```rb
# View for the action
<%= link_to 'Photo Record', photo_path(@photo) %>
```

Path helpers are automatically created when specifying a resource in `config/routes.rb`

```rb
# config/routes.rb
resources :photos
```

| HTTP Verb | Path             | Controller#Action | Named Helper         |
| --------- | ---------------- | ----------------- | -------------------- |
| GET       | /photos          | photos#index      | photos_path          |
| GET       | /photos/new      | photos#new        | new_photo_path       |
| POST      | /photos          | photos#create     | photos_path          |
| GET       | /photos/:id      | photos#show       | photo_path(:id)      |
| GET       | /photos/:id/edit | photos#edit       | edit_photo_path(:id) |
| PATCH/PUT | /photos/:id      | photos#update     | photo_path(:id)      |
| DELETE    | /photos/:id      | photos#destroy    | photo_path(:id)      |

### Asset Pipeline

Access images in the `app/assets/images` directory like this:

```html
<%= image_tag "rails.png" %>
```

Access images stored in the public folder: (e.e. public/gallery_photos/haf1.jpg)

```html
<%= image_tag("/gallery_photos/haf1.jpg") %>
```

Within views, link to JavaScript and CSS assets

```html
<%= stylesheet_link_tag "application" %> <%= javascript_include_tag
"application" %>
```

```html
<!-- Filenames are fingerprinted for cache busting -->
<link
  href="/assets/application-4dd5b109ee3439da54f5bdfd78a80473.css"
  media="screen"
  rel="stylesheet"
/>
<script src="/assets/application-908e25f4bf641868d8683022a5b62f54.js"></script>
```

Reference: [http://guides.rubyonrails.org/asset_pipeline.html](http://guides.rubyonrails.org/asset_pipeline.html)

### Form Helpers

Bind a form to a model for creating/updating a resource

#### Use this method if you're using strong params to protect against mass assignment

```rb
# app/controllers/photos_controller.rb
def new
  @photo = Photo.new
end
```

```rb
# ERB view
<%= form_for @photo, url: {action: "create"}, html: {class: "nifty_form"} do |f| %>
  <%= f.text_field :path %>
  <%= f.text_area :caption, size: "60x12" %>
  <%= f.submit "Create" %>
<% end %>
```

```html
<!-- HTML output -->
<form
  accept-charset="UTF-8"
  action="/photos/create"
  method="post"
  class="nifty_form"
>
  <input id="photos_path" name="photo[path]" type="text" />
  <textarea
    id="photos_caption"
    name="photo[caption]"
    cols="60"
    rows="12"
  ></textarea>
  <input name="commit" type="submit" value="Create" />
</form>
```

Create a form with a custom action and method

```rb
<%= form_tag("/search", method: "get") do %>
  <%= label_tag(:q, "Search for:") %>
  <%= text_field_tag(:q) %>
  <%= submit_tag("Search") %>
<% end %>
```

```html
<form accept-charset="UTF-8" action="/search" method="get">
  <input name="utf8" type="hidden" value="&#x2713;" />
  <label for="q">Search for:</label>
  <input id="q" name="q" type="text" />
  <input name="commit" type="submit" value="Search" />
</form>
```

### ERB

#### Translate Ruby data to a JavaScript variable for use in a script

`<script> var chartData = <%= raw @chart_data.to_json %>; </script>`

Show the console:
`<% console %>`

Reference: [http://guides.rubyonrails.org/form_helpers.html](http://guides.rubyonrails.org/form_helpers.html)

## Understanding database cleaning strategies in tests

- TLDR: In tests you need to clean out the database before each example. Use :transaction where possible.
- Use :deletion for Selenium features or when you have a lot of MyISAM tables.

### Understanding database cleaning

You want to clean out your test database after each test, so the next test can start from a blank database. To do so you have three options:

- Wrap each test in a transaction which is rolled back when you're done (through DatabaseCleaner.strategy = :transaction or config.use_transactional_fixtures = true)
- Truncate all tables after each test (through DatabaseCleaner.strategy = :truncation)
- Delete all rows after each test (through DatabaseCleaner.strategy = :deletion)

Additionally there are some constraints for when you can use transactions:

- Transactions cannot be used for Selenium features, where Rails and test run in different processes and thus don't see changes within the transaction of another process.
- Transactions are not available for MyISAM tables (which you might use for FULLTEXT indexes).
- If there is a transaction inside transaction, the rollback is will not support it. So we need :truncation instead of :transaction strategy

### Performance of different cleaning strategies

I measured the runtime of different strategies using an average-sized Rails project (with MySQL):

| | Cucumber | RSpec |
| Transaction | 87.14, 86.65 | 10.20, 10.11 |
| Truncation | 90.43, 90.69 | 26.82, 26.46 |
| Deletion | 86.20, 85.61 | 12.08, 12.12 |

What we can take away from this:

- Use transactions where possible. It is the faster option all around, and will scale better than deletion as your number of records grow.
- Use deletion for Selenium features or when you have a lot of MyISAM tables.
- Avoid truncation. In fact you should probably grep your project for :truncation and replace it with :deletion. An exception to this rule is when you are using a lot of foreign key constraints (you probably don't). In that case truncation might outperform deletion (but I didn't measure that).
- Take care to set config.use_transactional_fixtures = false when moving away from transactions. Using both transactions and another cleaning strategy will drag down your test performance by quite a bit.

## Reference

Sandi Metz Practical Object Oriented Design in Ruby:
<https://github.com/rainoverme002/Ruby-on-Rails-Developer-To-Be/blob/master/Summary%20of%20Practical%20Object%20Oriented%20Design%20in%20Ruby%20-%20Sandi%20Metz/Summary_of_practical_object_oriented.md>

Clean Code:
<https://github.com/amaratasia/clean-code-ruby>

Ruby Style Guide:
<https://github.com/airbnb/ruby>

Writing Fast Ruby
<https://github.com/JuanitoFatas/fast-ruby>

Avoid N+1 Queries
<https://semaphoreci.com/blog/2017/08/09/faster-rails-eliminating-n-plus-one-queries.html>

Spec Guide
<https://rspec.rubystyle.guide/>

Understanding Rspec database cleaning strategy
<https://makandracards.com/makandra/13045-understanding-database-cleaning-strategies-in-tests>
