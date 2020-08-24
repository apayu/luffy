# How to use?

building a background processing system in Ruby
This project only for demo and study, not for product..

### create a async

Create a very heavy service

```
# This task loading 5 seconds
VeryHeavyService.new(5).perform
```

use `perform_now`, I know it's some result, but we can add some feature in module

```
# This task loading 5 seconds
VeryHeavyService.perform_now(5)
```

use `perform_async`, and you don't need to wait every perform, because we use `Thread`

```
# This task loading 5 seconds
VeryHeavyService.perform_async(5)
```

amazing! but we have one problem, if we perform 20 times? this code will create 20 connections(if we connection some website, maybe we will be blocked..)

