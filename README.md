# ToPoro

Simple module which can be included into `ActiveRecord::Relation` - it allows to fetch data as ruby Structs instead of `ActiveRecord` classes.
Fetching data this way is a bit faster and wrapping data into Structs allows to use query results like any other Ruby objects.

## Installation

When running Rails:
add this line to your application's Gemfile:

```ruby
gem 'to_poro'
```

and include `ToPoro` module into `ActiveRecord::Relation` class.
One way of doing it is by adding a `config/to_poro_initializer.rb`:

```ruby
class ActiveRecord::Relation
  include ToPoro
end
```

## Usage

For example when fetching `Event` data and only `id` and `price` is needed:

```ruby
 Event.all.to_poro(:id, :date)
 => [
 #<struct  id=1, date=Tue, 07 Jun 2016>,
 #<struct  id=2, date=Wed, 08 Jun 2016>,
 ...
 ]
 ```

```ruby
 Event.where(deleted: false).to_poro(:id, :date)
 => [
 #<struct  id=1, date=Tue, 07 Jun 2016>,
 #<struct  id=2, date=Wed, 08 Jun 2016>,
 ...
 ]
 ```

```ruby
 Event.where(deleted: false).limit.(2).to_poro(:id, :date)
 => [
 #<struct  id=1, date=Tue, 07 Jun 2016>,
 #<struct  id=2, date=Wed, 08 Jun 2016>
 ]
 ```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
