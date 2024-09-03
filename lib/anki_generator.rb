# frozen_string_literal: true

require 'yaml'
require 'anki2'

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

  def generate_apkg(name, output_path:)
    deck = Anki2.new({ name: name, output_path: output_path })

    cards.each do |card|
      deck.add_card(card['front'], card['back'])
    end

    deck.save
  end
end
