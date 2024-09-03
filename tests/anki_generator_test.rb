# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/anki_generator'

# AnkiGeneratorTest class
class AnkiGeneratorTest < Minitest::Test
  def test_create_new_instance_successfully
    assert AnkiGenerator.new, 'Should create a new instance of AnkiGenerator'
  end
end
