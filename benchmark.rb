require 'benchmark'

# elapsed_time = Benchmark.realtime do
#     # run some code
#     sleep(1)
# end

# puts "It took #{elapsed_time}"
def time_it(description)
    elapsed_time = Benchmark.realtime { yield }
    puts "#{description} took #{elapsed_time}"
end

time_it("Sleepy code") do
    # run some code
    sleep(1)
end