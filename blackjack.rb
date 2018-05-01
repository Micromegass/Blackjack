=begin
1. Distributing the cards
2. Play users hand
    a)ask user if he wants another card or if he hits or stands
        b1) if wants a card 
            ==> if it passes go to number 4
             ==> if he wants another card go to number 2

        b2) if he stands 
                ==> go to 3 

3. Play hand of dealer
   a) Determine the value of dealer 
       a1) If value < 17 give him another card
            ==> if it passes go to number 4
            ==> else if go to point 3
            ==> else if go to number 4
        
4. Determine winner
    a) if the player has more than 21, dealer wins 
    b) if dealer has more than 21, player wins 
    c) if dealer has more than user, wins dealer
    d) else if user has more than  dealer, player wins 


5. Go back to 1. and play new game

=end



# How can I represent a card?
# How can I represent the card deck?
# How can I represent the cards that have dealer and player 


class Card 
    attr_reader :suit, :value 

    def initialize(suit, value)
        @suit = suit 
        @value = value     
    end 

    def value 
        return 10 if ["J", "Q", "K"].include(@value)
        return 11 if @value == 'A'
        return @value
    
    end
end 


c1 = Card.new(:hearts, 9)
c2 = Card.new(:clubs, 5)


class Deck

    attr_reader  :cards

    def initialize 
        @cards = []
        build_cards
    end 

    def take!
        @cards.shift
    end

        private 
            def build_cards 
                [:clubs, :diamonds, :spades, :hearts].each do |suit|
                (2..10).each do |number|
                @cards << Card.new(suit, number)
                end 
                ['J', 'Q', 'K', 'A'].each do |face|
                @cards << Card.new(suit, face)
                end
            end 
         @cards.shuffle!
        end
     

end 


class Hand 
    attr_reader :cards

    def initialize(deck)
      @deck = deck 
      @cards = []
    end

    def hit!
        @cards << @deck.take!
    end 

    def value

        val = 0
        @cards.each do |card|
            val += card.value
        end 
        val
    end 


end 

deck = Deck.new 
hand = Hand.new(deck)

puts "the deck has has #{deck.cards.length} cards"
puts "the hand has #{hand.cards.length}"

hand.hit!

puts "the deck has has #{deck.cards.length} cards"
puts "the hand has #{hand.cards.length}"





