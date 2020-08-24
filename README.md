# How to use?

building a background processing system in Ruby
This project only for demo and study, not for product..

## Create a async

Create a very heavy service

```
# This task loading 5 seconds
VeryHeavyService.new.perform(5)
```

use `perform_now`, I know it's some result, but we can add some feature in module

```
# This task loading 5 seconds
VeryHeavyService.perform_now(5)
```

use `perform_async`, and you don't need to wait every perform, because we use `Thread`

```
# This task loading 5 seconds, but you can continue implement next service
VeryHeavyService.perform_async(5)
```

amazing! but we have one problem, if we perform 20 times? this code will create 20 connections(if we connection some website, maybe we will be blocked..)

### producer/consumer pattern

reference: https://en.wikipedia.org/wiki/Producer%E2%80%93consumer_problem

## Create a queue

you can new a queue
```
Luffy.backend = Queue.new
# <Thread::Queue:0x00007f7ee5c33208>
```

use `perform_queue`
```
VeryHeavyService.perform_queue(5)
# <Thread::Queue:0x00007f8fa6a2d2c0>
```

and we have a queue to perform!
```
Luffy::Processor.start(5)
[Processor 0] This task loading 5 seconds
```


## Use Redis

now we have othre problem, before we use in-memory, but we want to like `Sidekiq`, implement a queue using `Redis`

so..here we go

we use different backend, new a Redis connection
```
Luffy.backend = Luffy::Backend::Redis.new
# <Luffy::Backend::Redis:0x00007fb18f152be0 @connection=#<Redis client v4.2.1 for redis://127.0.0.1:6379/0>>
```

now implement mutiple task to Redis queue
```
VeryHeavyService.perform_queue(3)
# => 1
VeryHeavyService.perform_queue(3)
# => 2
VeryHeavyService.perform_queue(3)
# => 3
VeryHeavyService.perform_queue(3)
# => 4
```

and use processor...
```
Luffy::Processor.start(5)
# [Processor 1] This task loading 3 seconds
# [Processor 3] This task loading 3 seconds
# [Processor 0] This task loading 3 seconds
# [Processor 2] This task loading 3 seconds
```

amazing!!! we implement a queue using Redis:)

reference: [Learning by building, a Background Processing System in Ruby](https://blog.appsignal.com/2019/04/02/background-processing-system-in-ruby.html)
