require "pry"
require_relative '../blackjack'

describe Deck do
  let(:deck) { Deck.new }

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck aftering being built" do
      expect(deck.cards.sort).to_not eq deck.cards
      expect(deck.cards.sort[0..1]).to eq ["10♠", "10♣"]
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 2

      deck.deal(2)

      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal(1)).to eq [correct_card]
    end
  end
end

describe Hand do
  let(:hand) { Hand.new(["10♦", "J♥"]) }
  let(:hand_2) { Hand.new(["10♦", "J♥", "9♦"]) }
  let(:hand_3) { Hand.new(["10♦", "J♥", "A♦"]) }
  let(:hand_4) { Hand.new(["10♦", "A♥", "A♦"]) }

  describe "#calculate_hand" do

    it "returns the correct score" do
      expect(hand.calculate_hand).to eq(20)
      expect(hand_2.calculate_hand).to eq(29)
    end

    it "determines which ace value to use" do
      expect(hand_3.calculate_hand).to eq(21)
      expect(hand_4.calculate_hand).to eq(12)
    end

  end
end
