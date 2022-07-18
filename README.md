puppet-lint-undef_in_function-check
===================================

[![Gem Version](https://img.shields.io/gem/v/puppet-lint-undef_in_function-check.svg)](https://rubygems.org/gems/puppet-lint-undef_in_function-check)
[![Gem Downloads](https://img.shields.io/gem/dt/puppet-lint-undef_in_function-check.svg)](https://rubygems.org/gems/puppet-lint-undef_in_function-check)
[![Donated by Camptocamp](https://img.shields.io/badge/donated%20by-camptocamp-fb7047.svg)](#transfer-notice)

A **DEPRECATED** puppet-lint plugin to check for undef in function calls.

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

~~When functions are called, `undef` is cast into an empty string. Passing `undef` to a function is most likely not what you mean to do.~~

Since the [modern Puppet function API](https://github.com/puppetlabs/puppet-specifications/blob/d2e1fcd91ed74270cbd51cf830f0338b1a10d7c4/language/func-api.md)
was introduced in Puppet 4, functions can now be passed `undef` and these parameters won't be cast to empty strings.

All new functions should be written using this API and older functions migrated to it.

Also considering that a puppet-lint plugin has no way of telling which API a function is written in, the use of this plugin is no longer recommended.

**It is DEPRECATED and no longer maintained.**

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
The maintainer preferred that Puppet Community (now [Voxpupuli](https://voxpupuli.org/)) take ownership of the module for future improvement and maintenance.
Existing pull requests and issues were transferred over, please fork and continue to contribute here instead of Camptocamp.

Previously: https://github.com/camptocamp/puppet-lint-undef_in_function-check
