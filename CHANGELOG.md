# currency_select change log

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](https://semver.org/).

## x.y.z (unreleased)

### Added

- Add support for Rails 7.1 (#146, #148, #149, #150),
  thanks to @hishammalik and @pnicholls

### Changed

### Deprecated

### Removed

- Drop support for Rails 6.0 (#142)

### Fixed

### Security

## 5.0.1

### Fixed

- Add missing files to the gemspec file (#137)

## 5.0.0

### Added

- Add official support for Ruby 3.2 (#125)

### Changed

- Allow the non-formbuilder version to set the selected option (#134)
- Drop whitespace between HTML tags (#115)

### Removed

- Drop support for Rails 5.2 (#112)
- Drop support for Ruby 2.6 and 2.7 (#111, #132)

## 4.1.0

### Added

- Add support for Ruby 3.1 (#105)

## 4.0.0

### Added

- Add support for Rails 7.0 (#96)

### Removed

- Drop support for Ruby 2.5 (#90)

## 3.0.0

### Added

- Add automatic gem release (#86, #88)
- Support Ruby 3 (#81)
- Add support for Rails 6.1 (#78, #79, #83)
- Check the code with RuboCop (#72)
- Add support for Ruby 2.7 (#66)

### Changed

- Switch the CI from Travis to GitHub Actions (#80, #85)
- Upgrade RSpec and RSpec-Rails (#71)
- Update the Ruby versions on Travis CI (#68)

### Removed

- Drop support for Ruby 2.4 (#70)
- Drop support for Rails < 5.2 (#65)

### Fixed

- Fix some RuboCop warnings (#73)
- Fix warnings in the `.travis.yml` (#67, #69)

## 2.0.0

### Added

- Add support for Rails 6.0
  ([#60](https://github.com/braingourmets/currency_select/pull/60))
- Officially support Rails 5.2
  ([#51](https://github.com/braingourmets/currency_select/pull/51))
- Add Ruby 2.5.1 to the Travis build matrix
  ([#49](https://github.com/braingourmets/currency_select/pull/49))

### Removed

- Drop support for Rails < 5.1
  ([#62](https://github.com/braingourmets/currency_select/pull/62))
- Drop support for Ruby < 2.4
  ([#61](https://github.com/braingourmets/currency_select/pull/61))
- Drop support for Ruby < 2.3
  ([#48](https://github.com/braingourmets/currency_select/pull/48))

### Fixed

- Add version to the requirements in the gemspec file
  ([#53](https://github.com/braingourmets/currency_select/pull/53))
- Fix file names references from the gemspec file
  ([#52](https://github.com/braingourmets/currency_select/pull/52))
- Fix value call on Rails 5.2
  ([#47](https://github.com/braingourmets/currency_select/pull/47))

## 1.0.0

### Added

- Officially support Rails 5.2
  ([#51](https://github.com/braingourmets/currency_select/pull/51))
- Add Ruby 2.5.1 to the Travis build matrix
  ([#49](https://github.com/braingourmets/currency_select/pull/49))

### Removed

- Drop support for Ruby < 2.3
  ([#48](https://github.com/braingourmets/currency_select/pull/48))

### Fixed

- Add version to the requirements in the gemspec file
  ([#53](https://github.com/braingourmets/currency_select/pull/53))
- Fix file names references from the gemspec file
  ([#52](https://github.com/braingourmets/currency_select/pull/52))
- Fix value call on Rails 5.2
  ([#47](https://github.com/braingourmets/currency_select/pull/47))

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
- Support for Ruby < 2.3.0 will be removed in version 1.0.0.

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
- Fix the Gemfile
  ([#19](https://github.com/braingourmets/currency_select/pull/19))
- Fix the order of name attribute and ID in the specs
  ([#18](https://github.com/braingourmets/currency_select/pull/18))
