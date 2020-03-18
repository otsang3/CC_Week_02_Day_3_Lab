require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drinks')
require_relative('../customer')

class DrinksTest < MiniTest::Test
end
