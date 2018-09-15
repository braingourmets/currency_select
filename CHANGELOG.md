# currency_select change log

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## x.y.z (unreleased)

### Added
- Add Ruby 2.5.1 to the Travis build matrix
  ([#49](https://github.com/braingourmets/currency_select/pull/49))

### Changed

### Deprecated

### Removed
- Drop support for Ruby < 2.3
  ([#48](https://github.com/braingourmets/currency_select/pull/48))

### Fixed
- Fix file names references from the gemspec file
  ([#52](https://github.com/braingourmets/currency_select/pull/52))
- Fix value call on Rails 5.2
  ([#47](https://github.com/braingourmets/currency_select/pull/47))

### Security

## 0.2.0

### Added
- Automatically use the version number from the VERSION file in the gemspec
  ([#32](https://github.com/braingourmets/currency_select/pull/32))
- Add a code of conduct
  ([#25](https://github.com/braingourmets/currency_select/pull/25))

### Changed
- Mark all Ruby files as frozen_string_literal: true
  ([#31](https://github.com/braingourmets/currency_select/pull/31))

### Deprecated
- Support for Rails < 5.0.0 will be removed in version 2.0.0.
- Support for Rails < 4.2.0 will be removed in version 1.0.0.
- Support for Ruby < 2.2.2 will be removed in version 2.0.0.
- Support for Ruby < 2.0.0 will be removed in version 1.0.0.

### Removed
- Remove pre-Rails-4.0-specific code
  ([#38](https://github.com/braingourmets/currency_select/pull/38))
- Drop Jeweler
  ([#28](https://github.com/braingourmets/currency_select/pull/28))

### Fixed
- Add ActionView as explicit dependency
  ([#34](https://github.com/braingourmets/currency_select/pull/34))
- Fix the check for only one active selection in the specs
  ([#27](https://github.com/braingourmets/currency_select/pull/27))
- Use ISO codes as select values, not the IDs
  ([#24](https://github.com/braingourmets/currency_select/pull/24))
- Fix the the Gemfile
  ([#19](https://github.com/braingourmets/currency_select/pull/19))
- Fix the order of name attribute and ID in the specs
  ([#18](https://github.com/braingourmets/currency_select/pull/18))
