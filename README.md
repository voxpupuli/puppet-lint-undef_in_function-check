puppet-lint-undef_in_function-check
===================================

[![License](https://img.shields.io/github/license/voxpupuli/puppet-lint-undef_in_function-check.svg)](https://github.com/voxpupuli/puppet-lint-undef_in_function-check/blob/master/LICENSE)
[![Test](https://github.com/voxpupuli/puppet-lint-undef_in_function-check/actions/workflows/test.yml/badge.svg)](https://github.com/voxpupuli/puppet-lint-undef_in_function-check/actions/workflows/test.yml)
[![Release](https://github.com/voxpupuli/puppet-lint-undef_in_function-check/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/puppet-lint-undef_in_function-check/actions/workflows/release.yml)
[![RubyGem Version](https://img.shields.io/gem/v/puppet-lint-undef_in_function-check.svg)](https://rubygems.org/gems/puppet-lint-undef_in_function-check)
[![RubyGem Downloads](https://img.shields.io/gem/dt/puppet-lint-undef_in_function-check.svg)](https://rubygems.org/gems/puppet-lint-undef_in_function-check)
[![Donated by Camptocamp](https://img.shields.io/badge/donated%20by-camptocamp-fb7047.svg)](#transfer-notice)

A puppet-lint plugin to check for undef in function calls.

## Installing

### From the command line

```shell
$ gem install puppet-lint-undef_in_function-check
```

### In a Gemfile

```ruby
gem 'puppet-lint-undef_in_function-check', :require => false
```

## Checks

### Undef passed to a function

When functions are called, `undef` is cast into an empty string. Passing `undef` to a function is most likely not what you mean to do.


#### What you have done

```puppet
somefunction(undef)
```

#### What you should have done

```puppet
somefunction('')
```


#### Disabling the check

To disable this check, you can add `--no-undef_in_function_assignment-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-undef_in_function_assignment-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_undef_in_function_assignment')
```

## Transfer Notice

This plugin was originally authored by [Camptocamp](http://www.camptocamp.com).
The maintainer preferred that Puppet Community take ownership of the module for future improvement and maintenance.
Existing pull requests and issues were transferred over, please fork and continue to contribute here instead of Camptocamp.

Previously: https://github.com/camptocamp/puppet-lint-undef_in_function-check

## License

This gem is licensed under the Apache-2 license.

## Release information

To make a new release, please do:
* update the version in the gemspec file
* Install gems with `bundle install --with release --path .vendor`
* generate the changelog with `bundle exec rake changelog`
* Check if the new version matches the closed issues/PRs in the changelog
* Create a PR with it
* After it got merged, push a tag. GitHub actions will do the actual release to rubygems and GitHub Packages
