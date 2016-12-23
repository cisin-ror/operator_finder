# OperatorFinder

Operator Finder is a flixable solution for finding mobile operator and its circle.
Our gem using JOLO api for finding mobile operator and its circle.

## Getting started

OperatorFinder 0.1.0 works with rails 4 and above. You can add it to your Gemfile with:

```gem 'operator_finder' ```

Run the bundle command to install it.

After you install OperatorFinder and add it to your Gemfile, you need to run the generator:

``` rails generate operator_finder:install ```

The generator will install an initializer which describes jolo api token configuration option. It is imperative that you take a look at it and add your jolo api token. You can create jolo api token by using https://joloapi.com. When you are done, you are ready to use OperatorFinder.


For using api, call this in your application

OperatorFinder.get_operator_detail(mobile_number) #=> operator_name circle_name

Example-

OperatorFinder.get_operator_detail(9926089659) #=> IDEA Madhya Pradesh

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

