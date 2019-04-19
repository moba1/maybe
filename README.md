# maybe

Maybe Monad for Crystal

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     maybe:
       github: moba1/maybe
   ```

2. Run `shards install`

## Usage

```crystal
require "maybe"

j = Maybe::Just.new(1)
p j.to_s # ==> Maybe::Just(Int32)(1)
p j.map { |x| x * 2 } # ==> Maybe::Just(Int32)(2)
p j.or_else(3) # ==> Maybe::Just(Int32)(1)

n = Maybe::Nothig(String).new # require type parameter in order to infer type
p n.to_s # ==> Maybe::Nothing(String)
p n.map { |x| x * 2 } # ==> Maybe::Nothing(Int32)
p n.or_else("Nothing!") # ==> Maybe::Just(String)("Nothing!")
```

## Contributing

1. Fork it (<https://github.com/moba1/maybe/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Yuma Fukuda](https://github.com/moba1) - creator and maintainer
