# [WIP] Locust

Generate examples for [mutation testing] of public APIs by [OpenAPI 2.0 schema object] descriptions.

<a href="https://evilmartians.com/">
<img src="https://evilmartians.com/badges/sponsored-by-evil-martians.svg" alt="Sponsored by Evil Martians" width="236" height="54"></a>

[![Gem Version][gem-badger]][gem]
[![Build Status][travis-badger]][travis]
[![Dependency Status][gemnasium-badger]][gemnasium]
[![Inline docs][inch-badger]][inch]

*And the locust went up over all the land of Egypt, and rested in all the coasts of Egypt: very grievous were they; before them there were no such locusts as they, neither after them shall be such. For they covered the face of the whole earth, so that the land was darkened*

## Synopsis

```ruby
require "locust"

# customizable examples generator (see the `Locust.configure` below)
builder = Locust.new

object_schema = {
  title: "phone",
  type:  "string",
}

# collection of examples
examples = builder[object_schema]
```

Did you expect something like this (and more)?

```ruby
examples.sample
# => "မြန်မာဘာသာ"
examples.take(3)
# => ["\r\n", "<script>window.alert();</script>", "فارسی"]
examples.next
# => "   "
```

How about more complex schema?

```ruby
object_schema = {
  title: "user",
  type: "object",
  properties: {
    id: {
      type:   "integer",
      format: "int64",
    },
    name: {
      type: "string",
    },
  },
  required: ["name"],
}

builder[definition].sample
# => { id: -983242, name: "\r\n" }
```

> Tu l’as voulu, Georges Dandin!

What about references?

**Nope!** The Locust uses only *denormalized* object schemas, where all the `$ref` keys are already substituted by the referred parts.

This is because the gem deals with any object, not only request/response part of the http(s) schema. That's why parsing full OpenAPI 2.0 schemas is out of its scope.

## How it Works

Under the hood the gem contains predefined collections of edge cases for [primitive data types] supported by OpenAPI. We will be glad if you could propose a new case, not covered by our examples.

When you add restrictions to primitives, we parameterize edge cases (with settings like `minimum` or `enum`, or [format]) to provide conforming values.

In nested object schemas we collect all the possible combinations of edge cases for primitives and use lazy enumerators.

## Custom Formats

Mutation testing is fine, but could we define something more reasonable?

You can. The Open API 2.0 defines [data type format][format] as open -- you can assign it any custom value.

For example, you can say that your string is a `human_name`:

```ruby
{ type: "string", format: "human_name" }
```

Neither Open API 2.0, nor a Locust know how to provide a human name, but you do. And you can make the Locust know it too:

```ruby
require "faker"

# customizable examples generator
builder = Locust.configure do |c|
  c.format "human_name" do |f|
    # provide as many different generators for this format as you need
    f.generator { Faker::Name.name }
    # some of them we shouldn't ever try to mutate
    f.generator(immutable: true) { Faker::Name.name_with_middle }
  end
end

# collection of examples
examples = builder[type: "string", format: "human_name"]

# a resulting example
examples.sample
# => "Mary Stuart"
```

Locust cannot provide any acceptable mutation for a custom `format` aside of generated exampes; you can help by using the "pattern" restriction.

Say you expect human names include any sequence of latin symbols, apostrophes, hyphens and spaces (think of "Mary-Ann d'Amour"). Let's add the pattern:

```ruby
examples = builder[type: "string", format: "human_name", pattern: "[A-Za-z|-' ]+"]

examples.sample # either takes a format
# => "John Donn"
examples.sample # or uses edge cases that satisfy the pattern
# => "Bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
```

When a [Locust] finds an unknown `format`, it looks at whether a `pattern` is defined as well; then its try to mutate a generated value and check whether the edge case satisfies the format.

In a sense, adding the `pattern` makes the schema worse until the pattern becomes so good it rejects all the inappropriate values. Now the schema is ready to pre-validate calls to the API at the application level.

> This is the very goal of the Locust -- to help you provide a specification that describe API behaviour as close as possible.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'locust'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install locust
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[codeclimate-badger]: https://img.shields.io/codeclimate/github/nepalez/locust.svg?style=flat
[codeclimate]: https://codeclimate.com/github/nepalez/locust
[gem-badger]: https://img.shields.io/gem/v/locust.svg?style=flat
[gem]: https://rubygems.org/gems/locust
[gemnasium-badger]: https://img.shields.io/gemnasium/nepalez/locust.svg?style=flat
[gemnasium]: https://gemnasium.com/nepalez/locust
[inch-badger]: http://inch-ci.org/github/nepalez/locust.svg
[inch]: https://inch-ci.org/github/nepalez/locust
[travis-badger]: https://img.shields.io/travis/nepalez/locust/master.svg?style=flat
[travis]: https://travis-ci.org/nepalez/locust
[mutation testing]: https://en.wikipedia.org/wiki/Mutation_testing
[OpenAPI 2.0 schema object]: https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
[primitive data types]: https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types
[format]: https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#dataTypeFormat
