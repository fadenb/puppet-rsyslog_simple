# rsyslog_simple
A simple rsyslog puppet module.

Inspired by puppet-rsyslog by saz (https://github.com/saz/puppet-rsyslog)

[![Build Status](https://travis-ci.org/fadenb/puppet-rsyslog_simple.png)](https://travis-ci.org/fadenb/puppet-rsyslog_simple)


## License
Apache License, Version 2.0

## Contact
See my GitHub page

## Support
Nope

## Example usage
### Syslog server
```
  class { '::rsyslog_simple::server': }
```

### Syslog client
#### logging to a specified server
```
  class { '::rsyslog_simple::client':
    logserver => 'custom-syslog-destination.example.com',
  }
```

#### Automagically log to syslog server
```
  Rsyslog_simple::Exported_client <<| |>>
```
  TODO: configurable tags?
