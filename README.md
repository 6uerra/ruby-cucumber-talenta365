## Selenium-Ruby-Cucumber

=================

selenium-cucumber : Automation Testing Using Ruby

Behaviour-Driven Development (BDD) is the software development process that Cucumber was built to support.
There’s much more to BDD than just using Cucumber.

## Documentation

* [Installation](https://www.ruby-lang.org/es/documentation/installation/)
* [Cucumber](https://docs.cucumber.io/)
* [Cucumber_Method](https://www.rubydoc.info/gems/selenium-cucumber/toplevel)
* [Ruby](https://ruby-doc.org/)
* [Rspec](http://rspec.info/documentation/)
* [RuboCop](https://rubocop.readthedocs.io/en/latest/)


## Project Architecture

    Project-Name
        |
        |_features
        |   |_step_definitions
        |   |   |_step.rb
        |   |   |...
        |   |_support
        |   |   |_env.rb
        |   |   |_hooks.rb
        |   |   |...
        |   |_features
        |   |...
        |_services
        |   |_env_vars.rb
        |   |_helpers.rb
        |_views
        |   |_views.rb
        |   |...
        |_env
        |_Gemfile
        |_ChromeDriver
    

* **features** - A feature would describe the current test script which has to be executed. (files .feature ext) goes here, 
* **features/_step_definitions** - you can define step defintion under this package for your feature steps.
* **features/support/env_vars** - here we define the initial settings as the browser settings and the call of the modules.
* **features/support/hooks** - Define actions after/before each feature/scenario/tag.
* **services/_env_vars** - With this file we call for the use of environment variables.
* **services/_helpers** - Create modules and methods that you think can be used for many steps/features.
* **_views/_views** - Here you must define all those methods that are reused in a specific feature and are not transversal to the project.
* **/env** - here we define all the environment variables to be used throughout the project.
* **/Gemfile** - In this file is To define the dependencies (gems) used in the project


## Running test

Go to your project directory from terminal and hit following commands
* `bundle install`  - Bundler manages an application's dependencies through its entire life, across many machines, systematically and repeatably
* `bundle exec cucumber` - Run all features.
* `bundle exec cucumber features/xxxx.feature`  - to run specific feature.
* `pending uploading of information` to generate a HTML report.



## License

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

