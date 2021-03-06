[ ![Codeship Status for CraigWilliams/relational](https://codeship.com/projects/8ee97f50-616c-0132-7ade-6299e400ce23/status)](https://codeship.com/projects/51838)

# Relational

### ActiveRecord helpers

This is an ActiveRecord helper gem that simplifies  
some of the boilerplate code needed to use ActiveRecord.

The first of which is:

`has_many_though`

Normally, we write has many through like this

```ruby
class User
    has_many :users_roles
    has_many :users, though: :users_roles
end
```

`has_many_through` shortens this to one line


```ruby
has_many_through :roles, :users_roles
```

### Convention

By following a convention of naming the join table using  
the resource as the first part of the name, we only have  
to supply the join table name.

In this join, we want the `User` model to have many `roles`
using the `roles_users` table

```ruby
has_many_through :roles_users
```

### Even shorter

Along the lines of brevity, the shortcut `hmt` is available

```ruby
hmt :roles_users
```

### Through syntax

If you want to specify the the resource and the join table  
but the table name does not include the resource name,  
you can use `through`.

In this example, the `resource` is `invoices` and the  
join table is `clients`

```ruby
hmt :invoices_through_clients
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'relational'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install relational

## Contributing

1. Fork it ( https://github.com/[my-github-username]/relational/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
