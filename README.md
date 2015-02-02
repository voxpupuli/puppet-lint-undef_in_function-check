puppet-lint-undef_in_function-check
=================================

[![Build Status](https://travis-ci.org/camptocamp/puppet-lint-undef_in_function-check.svg)](https://travis-ci.org/camptocamp/puppet-lint-undef_in_function-check)
[![Code Climate](https://codeclimate.com/github/camptocamp/puppet-lint-undef_in_function-check/badges/gpa.svg)](https://codeclimate.com/github/camptocamp/puppet-lint-undef_in_function-check)
[![Gem Version](https://badge.fury.io/rb/puppet-lint-undef_in_function-check.svg)](http://badge.fury.io/rb/puppet-lint-undef_in_function-check)
[![Coverage Status](https://img.shields.io/coveralls/camptocamp/puppet-lint-undef_in_function-check.svg)](https://coveralls.io/r/camptocamp/puppet-lint-undef_in_function-check?branch=master)

A puppet-lint plugin to check for undef in function calls.


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
