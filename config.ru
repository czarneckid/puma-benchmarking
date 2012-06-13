$LOAD_PATH << '.'

require 'api'
require 'redis'

$redis = Redis.new

run PumaBenchmark::API