# frozen_string_literal: true

require 'yaml'
require 'anki'

# AnkiGenerator -> Class
class AnkiGenerator
  attr_accessor :deck_file, :cards

  def initialize(deck_file:)
    self.deck_file = deck_file
    self.cards = []

    fill_cards
  end

  def fill_cards
    self.cards = YAML.load_file(deck_file)
  end

  def generate_apkg(output_file:)
    deck = Anki::Deck.new('Generated Anki Deck')

    cards.each do |card|
      deck.add_note(
        card['front'],
        card['back']
      )
    end

    deck.save(output_file)
  end
end
