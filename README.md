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