# Grape Pagination

Provides helpers for paginating collections in [Grape](https://github.com/intridea/grape)
endpoints. Currently only works with with [will\_paginate](https://github.com/mislav/will_paginate),
or something that responds to the same `paginate` interface.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grape-pagination'
```

## Usage

Tag your endpoint as supporting pagination params, then use the `paginate`
helper.

```ruby
class API < Grape::API
  desc 'Gets everything!'
  paginate
  get do
    paginate collection
  end
end
```

Which would result in a paginated collection and the following headers set:

```
X-Total: 150
Link: <http://localhost:5000/api/v1/tweets?page=2&per_page=30>; rel="next"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
