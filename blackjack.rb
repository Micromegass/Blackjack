


class Card 
    attr_reader :suit, :value 

    def initialize(suit, value)
        @suit = suit 
        @value = value     
    end 

    def value 
        return 10 if ["J", "Q", "K"].include?(@value)
        return 11 if @value == 'A'
        return @value
    
    end


    def to_s
        "#{@value} - #{suit}"
    end  

end 

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


    def to_s
     str = ""
        @cards.each do |card|
        str += "#{card}  "
        end 
        str.strip

    end 
end 

deck = Deck.new 
dealer = Hand.new(deck)
player = Hand.new(deck)

player.hit!
player.hit!
dealer.hit!

puts
puts "dealer: #{dealer}     (#{dealer.value})"
puts "player: #{player}     (#{player.value})"



while player.value <= 21
    puts
    puts "your turn:"
    puts
    print "Card(c) or stand (s) "
    option = gets.chomp

      
    if option == 'c'
        player.hit!
        puts "  #{player}   (#{player.value}) "
        puts
    elsif option == 's'
        break

    else 
    puts "this is not a valid option. Please enter c or s"
    puts
    puts "your turn:"
    print "Card(c) or stand (s) "
    end        
 
end 


    puts "turn of dealer"
    puts


if player.value < 21 
 dealer.hit!
 puts "  #{dealer}     (#{dealer.value})"   

while dealer.value < 17
    dealer.hit!
    puts "  #{dealer}     (#{dealer.value})"
end 
end 




if player.value > 21
    puts "you lost =("
elsif dealer.value > 21 
    puts "you won =)"
elsif dealer.value == player.value 
    puts "draw!"
 elsif dealer.value > player.value
    puts "You lost =("      
 else
    puts "you won =)"
end 

puts
puts "the dealer has #{dealer.value} points "
puts "the player has #{player.value} points "





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



