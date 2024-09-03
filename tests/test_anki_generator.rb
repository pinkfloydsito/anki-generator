# frozen_string_literal: true

require 'minitest/autorun'
require 'yaml'
require_relative '../lib/anki_generator' # Assuming your main class file is named `anki_generator.rb`

class AnkiGeneratorTest < Minitest::Test
  def setup
    @temp_yaml_file = 'temp_flashcards.yaml'
    @temp_apkg_file = 'temp_deck.apkg'

    flashcards = [
      { 'front' => 'What is Big O notation?',
        'back' => 'Big O notation is a mathematical notation that describes the limiting behavior of a function when the argument tends towards a particular value or infinity.' },
      { 'front' => 'Define a graph.', 'back' => 'A graph is a collection of vertices connected by edges.' }
    ]

    File.open(@temp_yaml_file, 'w') do |file|
      file.write(flashcards.to_yaml)
    end
  end

  def teardown
    File.delete(@temp_yaml_file) if File.exist?(@temp_yaml_file)
    File.delete(@temp_apkg_file) if File.exist?(@temp_apkg_file)
  end

  def test_fill_cards
    anki_generator = AnkiGenerator.new(name: 'test', deck_file: @temp_yaml_file)
    assert_equal 2, anki_generator.cards.length
    assert_equal 'What is Big O notation?', anki_generator.cards.first['front']
  end

  def test_generate_apkg
    anki_generator = AnkiGenerator.new(name: 'test', deck_file: @temp_yaml_file)
    anki_generator.generate_apkg(output_path: @temp_apkg_file)

    assert File.exist?(@temp_apkg_file), 'The .apkg file should be created'
  end
end
