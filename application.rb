require "stringio"

class Application
    attr_accessor :environment

    def initialize
        @environment = :development
    end

    def connect_to_database
        puts "Connecting to #{@environment} database..."
    end

    def handle_request
        puts "Handling #{@environment} request..."
    end

    def write_to_log
        puts "Writing to #{@environment} log file..."
    end

    def in_environment(new_environment)
        temp_environment = @environment
        @environment = new_environment
        yield
    rescue Exception => e
        puts e.message
    ensure
        @environment = temp_environment
        puts "Reset environment to #{@environment}"
    end
end

app = Application.new
# app.environment = :production
# app.connect_to_database
# app.handle_request
# app.write_to_log
# app.environment = :development

# app.in_environment do
#     app.connect_to_database
#     app.handle_request
#     raise "Boom!"
#     app.write_to_log
# end

# app.connect_to_database

# app.in_environment(:production) do
#     app.connect_to_database
#     app.handle_request
#     app.write_to_log
# end

# app.in_environment(:test) do
#     app.connect_to_database
#     app.handle_request
#     app.write_to_log
# end

def capture_output
    begin
        old_output = $stdout
        $stdout = StringIO.new
        yield
        result = $stdout.string
    ensure
        $stdout = old_output
    end
    result
end

output = capture_output do
    puts "Hello!"
    puts "Pleased to meet you."
    puts "Goodbye..."
end

# puts output