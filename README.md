# puma-benchmarking

Benchmarking for [puma.io](http://puma.io).

# Setup

Run under Unicorn or Puma in one terminal and then run the benchmarking in another terminal.

## Running under Unicorn

```
rvm use ruby-1.9.3@puma-benchmarking --create
bundle install
unicorn -c unicorn.rb
```

## Running under Puma

```
rvm use jruby-1.6.7.2@puma-benchmarking --create
bundle install
puma -t 4:4
```

## Benchmarking with ab

```
ab -n 10000 -c 50 -k http://localhost:9292/health/ping
```

# Results

## TL;DR

Unicorn: Requests per second:    1493.28 [#/sec] (mean)
Puma: Requests per second:    782.52 [#/sec] (mean)

## Unicorn

```
Server Software:        
Server Hostname:        localhost
Server Port:            9292

Document Path:          /health/ping
Document Length:        29 bytes

Concurrency Level:      50
Time taken for tests:   6.697 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    0
Total transferred:      1720143 bytes
HTML transferred:       290000 bytes
Requests per second:    1493.28 [#/sec] (mean)
Time per request:       33.483 [ms] (mean)
Time per request:       0.670 [ms] (mean, across all concurrent requests)
Transfer rate:          250.84 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.5      0      10
Processing:    13   33   5.7     33      72
Waiting:       12   33   5.7     32      68
Total:         14   33   5.7     33      72

Percentage of the requests served within a certain time (ms)
  50%     33
  66%     35
  75%     36
  80%     37
  90%     41
  95%     43
  98%     47
  99%     50
 100%     72 (longest request)
 ```

## Puma

```
Server Software:        
Server Hostname:        localhost
Server Port:            9292

Document Path:          /health/ping
Document Length:        29 bytes

Concurrency Level:      50
Time taken for tests:   12.779 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    10000
Total transferred:      1240000 bytes
HTML transferred:       290000 bytes
Requests per second:    782.52 [#/sec] (mean)
Time per request:       63.896 [ms] (mean)
Time per request:       1.278 [ms] (mean, across all concurrent requests)
Transfer rate:          94.76 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       1
Processing:     1    5  13.6      3     632
Waiting:        0    5  13.4      3     630
Total:          1    5  13.6      3     634

Percentage of the requests served within a certain time (ms)
  50%      3
  66%      4
  75%      5
  80%      6
  90%      9
  95%     13
  98%     19
  99%     24
 100%    634 (longest request)
```