Coderetreats app for the video series [Build an app with Corey Haines](http://cleancoders.com/)

### Slight modificatons:
- Using Ruby 2, Rails 4.0.0
- Using RSpec 2.14.0.rc1 `allow` syntax for stubbing constants and methods
- Using RSpec feature specs instead of Cucumber

### Current Issues
- Had to fix a strange circular dependency issue on the namespaced `Coderetreats::StatusController` by adding `require_relative '../../../app/controllers/coderetreats/status_controller'
`
- Original CSS file doesn't seem to play nice in Rails 4, so for now it's disabled

## Social

<a href="http://stackoverflow.com/users/567863/paul-fioravanti">
  <img src="http://stackoverflow.com/users/flair/567863.png" width="208" height="58" alt="profile for Paul Fioravanti at Stack Overflow, Q&amp;A for professional and enthusiast programmers" title="profile for Paul Fioravanti at Stack Overflow, Q&amp;A for professional and enthusiast programmers">
</a>

[![endorse](http://api.coderwall.com/pfioravanti/endorsecount.png)](http://coderwall.com/pfioravanti)