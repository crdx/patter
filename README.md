# patter

**patter** is a ruby gem that generates strings from patterns.

A pattern is a sequence of tags and modifiers that defines the format of the output. For more on patterns see the [CLI](#cli) help output below.

## Installation

Build and install locally:

```
just install
```

Alternatively install from [rubygems](https://rubygems.org/gems/patter):

```
gem install patter
```

## Usage

### CLI

```
Usage:
    patter [options] <pattern>
    patter --version

Generate strings from <pattern>.

Options:
    -n, --count N       Number of patterns to generate [default: 10]
    -v, --version       Show version

Tags:
    {A} adjective       {N} noun
    {S} symbol          {D} digit
    {C} character

Modifiers:
    s: plural           t: titlecase
    u: uppercase        l: lowercase
    a: AlTeRnAtE case
    <number>: repeat <number> times

Apply modifiers using a colon after the tag name.

Examples:
    Ten random uppercase letters: {C:10u}
    Three camelcase nouns:        {N:3t}
    Plural, titlecase noun:       {N:ts}
    Uppercase adjective:          {A:u}
    Five random digits:           {D:5}
    A username:                   {A}_{N}
```

### API

```rb
require 'patter'

puts Patter::Pattern.new('{A}')
```

## Unit tests

```
just test
```

## Contributions

Open an [issue](https://github.com/crdx/patter/issues) or send a [pull request](https://github.com/crdx/patter/pulls).

## Licence

[GPLv3](LICENCE).
