# patter

**patter** is a ruby gem for generating strings from patterns.

A pattern is a sequence of tags and modifiers that define the format of the output. For more on patterns see the [Command-line](#command-line) help output below.

## Installation

```
tools/build
sudo gem install gems/patter-<version>.gem
```

Alternatively install from rubygems.org.

```
gem install patter
```

## Command-line

```
$ patter --help

Usage: patter [options] <pattern>

Generate strings from <pattern>.

-n, --count N     Number of patterns to generate [default: 10].
-h, --help        Show this help.

TAGS

  {A} adjective       {N} noun
  {S} symbol          {D} digit
  {C} character

MODIFIERS

  s: plural           t: titlecase
  u: uppercase        l: lowercase
  a: AlTeRnAtE case
  <number>: repeat <number> times

Apply modifiers using a colon after the tag name.

EXAMPLES

  Ten random uppercase letters: {C:10u}
  Three camelcase nouns:        {N:3t}
  Plural, titlecase noun:       {N:ts}
  Uppercase adjective:          {A:u}
  Five random digits:           {D:5}
  A username:                   {A}_{N}

```

## Ruby API

```rb
require 'patter'

puts Patter::Pattern.new('{A}')
```

## Bugs or contributions

Open an [issue](http://github.com/crdx/patter/issues) or send a [pull request](http://github.com/crdx/patter/pulls).

## Licence

[MIT](LICENCE.md).
