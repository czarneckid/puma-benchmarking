# puma-benchmarking

Benchmarking for [puma.io](http://puma.io).

# Setup

## Running under Unicorn

```
rvm use ruby-1.9.3@puma-benchmarking --create
unicorn -c unicorn.rb
```

```
ab -n 10000 -c 50 -k http://localhost:9292/health/ping
```

## Running under Puma

```
rvm use jruby-1.6.7.2@puma-benchmarking --create
```