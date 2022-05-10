require_relative "my_enumerable"

class Song
    attr_reader :name, :artist, :duration

    def initialize(name, artist, duration)
        @name = name
        @artist = artist
        @duration = duration
    end

    def play
        puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
    end

    def each_filename
        base_name = "#{@name} #{@artist}".gsub(" ", "-").downcase
        extension = [".mp3", ".wav", ".aac"]
        extension.each do |e|
            yield base_name + e
        end
    end
end

class Playlist
    include MyEnumerable
    # include Enumerable

    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        @songs << song
    end

    def each
        @songs.each do |song| 
            # puts "Yielding #{song.name}..."
            yield song 
        end
    end

    def play_songs
        each { |song| song.play }
    end

    def each_tagline
        @songs.each do |song|
            yield "#{song.name} - #{song.artist}"
        end
    end

    def each_by_artist(artist)
        my_select { |song| song.artist == artist }.each { |song| yield song }
    end
end

song1 = Song.new("Okie From Muskogee", "Merle", 5)
song2 = Song.new("Ramblin' Man", "Hank", 7)
song3 = Song.new("Good Hearted Woman", "Waylon", 6)
song4 = Song.new("Other song", "Hank", 5)

playlist = Playlist.new("Country/Western, Y'all!")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)
playlist.add_song(song4)

# playlist.each { |song| song.play }
# playlist.play_songs  

okie_songs = playlist.my_select { |song| song.name =~ /Okie/ }
p okie_songs

song_labels = playlist.my_map { |song| "#{song.name} - #{song.artist}" }
p song_labels

non_okie_songs = playlist.my_reject { |song| song.name =~ /Okie/ }
p non_okie_songs

p playlist.my_detect { |song| song.artist == "Hank" }

p playlist.my_any? { |song| song.artist == "Hank" }

total_duration = playlist.my_reduce(0) { |sum, song| sum + song.duration }
p total_duration
# p playlist.select { |song| song.artist == "Hank" }
# playlist.each_tagline { |tagline| puts tagline }
# playlist.each_by_artist("Hank") { |song| song.play }

# song1.each_filename { |filename| puts filename }