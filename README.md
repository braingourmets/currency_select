# CurrencySelect

[![GitHub CI Status](https://github.com/braingourmets/currency_select/workflows/CI/badge.svg?branch=main)](https://github.com/braingourmets/currency_select/actions)
[![Gem Version](https://badge.fury.io/rb/currency_select.svg)](http://badge.fury.io/rb/currency_select)

Adds a currency_select helper to Ruby on Rails projects, allowing you to get
a HTML select list of available currencies.

The list of currencies are provided by the
[Money gem](https://rubygems.org/gems/money).

## New maintainer wanted

We're not using this gem anymore, so we'm looking for a new maintainer. If
you're interested in becoming the new maintainer, please contact us at
`info AT braingourmets DOT com`.

## Installation

Add the following to your Gemfile:

```ruby
gem 'currency_select'
```

## Example

```ruby
currency_select('user', 'currency')
```

### form_for example

```
<%= f.currency_select(:currency, ["USD", "EUR", "CAD"], {}, {class: "form-control"}) -%>
```

## Contributing to this project

### Code of Conduct

This project adheres to a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project and its community, you are expected to uphold
this code.

## Maintainers

* [Oliver Klee](https://github.com/oliverklee)
