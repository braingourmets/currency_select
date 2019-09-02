# CurrencySelect

[![Build Status](https://travis-ci.org/braingourmets/currency_select.svg?branch=master)](https://travis-ci.org/braingourmets/currency_select)
[![Gem Version](https://badge.fury.io/rb/currency_select.svg)](http://badge.fury.io/rb/currency_select)

Adds a currency_select helper to Ruby on Rails projects, allowing you to get
a HTML select list of available currencies.

The list of currencies are provided by the
[Money gem](https://rubygems.org/gems/money).

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
