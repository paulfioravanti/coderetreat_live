Coderetreats app for the video series [Build an app with Corey Haines](http://cleancoders.com/)

### Slight modificatons:
- Using Ruby 2, Rails 4.0.0.rc1
- Using RSpec 2.14.0.rc1 `allow` syntax for stubbing constants and methods
- Using RSpec feature specs instead of Cucumber

### Current Issues
- Had to fix a strange circular dependency issue on the namespaced `Coderetreats::StatusController` by adding `require_relative '../../../app/controllers/coderetreats/status_controller'
`
- Original CSS file doesn't seem to play nice in Rails 4, so for now it's disabled