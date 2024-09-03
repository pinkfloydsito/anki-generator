# frozen_string_literal: true

class AnkiGenerator
  def initialize(deck_file:)
    self.deck_file = deck_file
    self.cards = []

    fill_cards
  end

  def fill_cards
    puts 'test'
  end
end
