require 'timeout'

def try_with_timeout(time)
    begin
        Timeout.timeout(time) do
            yield
        end
    rescue Timeout::Error 
        # handle it however you like!
        puts "Took too long!"
    end
end

try_with_timeout(2.0) do
    sleep 3.0
    puts "That was refreshing..."
end