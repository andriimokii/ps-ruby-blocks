class Flyer
    attr_reader :name, :email, :miles_flown

    def initialize(name, email, miles_flown)
        @name = name
        @email = email
        @miles_flown = miles_flown
    end

    def to_s
        "#{name} (#{email}): #{miles_flown}"
    end
end

array = []
1.step(10, 2) do |n|
    array << Flyer.new("Flyer #{n}", "flyer#{n}@example.com", n * 1000)
end
# puts array
array.each { |f| puts "#{f.name} - #{f.miles_flown} miles" }

sum = 0
array.each do |f|
    sum += f.miles_flown
end
puts "Total miles flown: #{sum}"

promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }
promotions.each do |a, p|
    puts "Earn #{p}x miles by flying #{a}!"
end

array.each do |f|
    promotions.each do |a, p|
        puts "#{f.name} could earn #{f.miles_flown * p} miles by flying #{a}!"
    end
end
