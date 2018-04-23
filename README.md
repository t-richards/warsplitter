# warsplitter

A really dumb parser of sorts.

## Installation

Add this to your application's `shard.yml`:

```
dependencies:
  warsplitter:
    github: t-richards/warsplitter
```

## Usage

```crystal
require "warsplitter"

war = War.new("dogs vs cats ; in the context of who is the snuggliest")
pp war # => War(
       #     @first_option="dogs",
       #     @second_option="cats",
       #     @context="in the context of who is the snuggliest")
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/t-richards/warsplitter/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [t-richards](https://github.com/t-richards) Tom Richards - creator, maintainer
