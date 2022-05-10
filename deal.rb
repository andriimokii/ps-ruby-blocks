def deal(count)
    faces = ["Jack", "Queen", "King", "Ace"]
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]

    # call the block here
    count.times do 
        random_face = faces.sample
        random_suit = suits.sample
        calc_score = block_given? ? yield(random_face, random_suit) : puts("No deal!")
        puts "You scored a #{calc_score}!"
    end
end

deal(2) do |face, suit|
    puts "Dealt a #{face} of #{suit}"
    face.length + suit.length
end

# def n_times(count)
#     1.upto(count) do |n|
#         yield n
#     end
# end

# n_times(5) do |n|
#     puts "#{n} situps"
#     puts "#{n} pushups"
#     puts "#{n} chinups"
# end

# def progress
#     0.step(by: 10, to: 100) do |num|
#         yield num
#     end
# end

# progress { |percent| puts percent }

def greet
    yield
end

greet { |name, age| puts "Hello, #{name.class}. You don't look #{age}!" }