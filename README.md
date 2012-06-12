# puma-benchmarking

Benchmarking for [Puma](http://puma.io). Exercise in trying to benchmark Puma against Unicorn 
to try and replicate the benchmarking results on the [Puma](http://puma.io) site. At the very 
least just see how Puma stacks up.

# Setup

Run under Unicorn or Puma in one terminal and then run the benchmarking in another terminal.

## Running under MRI - 1.9.3 / Unicorn

```
rvm use ruby-1.9.3@puma-benchmarking --create
bundle install
unicorn -c unicorn.rb
```

## Running under JRuby (1.6.7.2) - 1.9.2 / Puma

```
rvm use jruby-1.6.7.2@puma-benchmarking --create
bundle install
ruby --1.9 `which puma` -t 4:4
```

## Running under Rubinius (1.2.4) - 1.8.7 / Puma

```
rvm use rbx-1.2.4@puma-benchmarking --create
bundle install
puma -t 4:4
```

## Running under Rubinius (Head) - 1.9.3 / Puma

```
rvm use rbx-head@puma-benchmarking --create
bundle install
ruby -X19 `which puma` -t 4:4
```

## Benchmarking with ab

```
ab -n 10000 -c 50 -k http://localhost:9292/health/ping
```

# Results

## TL;DR

MRI - 1.9.3 / Unicorn: Requests per second:    1493.28 [#/sec] (mean)

JRuby (1.6.7.2) - 1.9.2 / Puma: Requests per second:    1460.20 [#/sec] (mean)

Rubinius (1.2.4) - 1.8.7 / Puma: Requests per second:    55.09 [#/sec] (mean)

Rubinius (Head) - 1.9.3 / Puma: Requests per second:    1225.02 [#/sec] (mean)

## MRI - 1.9.3 / Unicorn

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

## JRuby (1.6.7.2) - 1.9.2 / Puma

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            9292

Document Path:          /health/ping
Document Length:        29 bytes

Concurrency Level:      50
Time taken for tests:   6.848 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    10000
Total transferred:      1240000 bytes
HTML transferred:       290000 bytes
Requests per second:    1460.20 [#/sec] (mean)
Time per request:       34.242 [ms] (mean)
Time per request:       0.685 [ms] (mean, across all concurrent requests)
Transfer rate:          176.82 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       1
Processing:     1    2   1.0      2       6
Waiting:        1    2   0.9      2       6
Total:          1    2   1.0      2       7

Percentage of the requests served within a certain time (ms)
  50%      2
  66%      2
  75%      3
  80%      3
  90%      3
  95%      4
  98%      5
  99%      5
 100%      7 (longest request)
```

## Rubinius (1.2.4) - 1.8.7 / Puma

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            9292

Document Path:          /health/ping
Document Length:        2103 bytes

Concurrency Level:      50
Time taken for tests:   181.526 seconds
Complete requests:      10000
Failed requests:        9989
   (Connect: 0, Receive: 0, Length: 9989, Exceptions: 0)
Write errors:           0
Non-2xx responses:      38
Keep-Alive requests:    9976
Total transferred:      1326386 bytes
HTML transferred:       379084 bytes
Requests per second:    55.09 [#/sec] (mean)
Time per request:       907.631 [ms] (mean)
Time per request:       18.153 [ms] (mean, across all concurrent requests)
Transfer rate:          7.14 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.3      0      10
Processing:     1  304 5697.1      2  181511
Waiting:        0  467 7508.0      1  181511
Total:          1  304 5697.4      2  181517

Percentage of the requests served within a certain time (ms)
  50%      2
  66%      3
  75%      4
  80%      5
  90%     10
  95%     28
  98%     68
  99%    142
 100%  181517 (longest request)
```

## Rubinius (Head) - 1.9.3 / Puma

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            9292

Document Path:          /health/ping
Document Length:        29 bytes

Concurrency Level:      50
Time taken for tests:   8.163 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    10000
Total transferred:      1240000 bytes
HTML transferred:       290000 bytes
Requests per second:    1225.02 [#/sec] (mean)
Time per request:       40.816 [ms] (mean)
Time per request:       0.816 [ms] (mean, across all concurrent requests)
Transfer rate:          148.34 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       1
Processing:     1    2   5.4      1     367
Waiting:        1    2   5.4      1     367
Total:          1    2   5.4      1     368

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      1
  75%      1
  80%      1
  90%      2
  95%      5
  98%      7
  99%      8
 100%    368 (longest request)
```