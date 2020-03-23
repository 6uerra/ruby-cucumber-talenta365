require 'rubygems'
require 'selenium-cucumber'
require 'selenium-webdriver'
require 'byebug'

# load all files and modules
relative_paths = ['/views/*.rb', '/services/*.rb']

full_paths = relative_paths.map { |relative_path| Dir.pwd << relative_path }

full_paths.each do |path|
  Dir[path].each do |f|
    module_name = f.split('/').last.split('.')[0].capitalize
    # to upper camel case
    module_name = module_name.gsub(/_(\w)/) { Regexp.last_match(1).upcase }
    require f
    include Kernel.const_get(module_name)
  end
end

# driver initialization
begin
  chromedriver_path = File.join(File.absolute_path(''), 'chromedriver')
  Selenium::WebDriver::Chrome::Service.driver_path = chromedriver_path
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--ignore-certificate-errors')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-translate')
  $driver = Selenium::WebDriver.for :chrome, options: options
  $driver.manage.window.maximize
  
rescue Exception => e
  p e.message
  Process.exit(0)
  $driver.quit
end