# Smart Pension test task
## Description
This program is designed to read from log file and provide statistics.
## Instalation
Clone the repository.
```
Install ruby (2.6.3)

$ bundle install
```
## Usage
```
Granting permissions:
chmod +x bin/statistics_script

Running the script:
$ ./bin/statistics_script log/webserver.log
```

## What this script does:
```
* Validates file with logs (if it's exist?, if it's not empty?)
* Analyzes provided file by two strategies (most visited, most unique visited)
* Outputs results to stdout stream (console)
```

## Running tests
```
rspec
```
## Possible improvements:
```
* Large files handling (to not load all file in memory)
* Add validations for records in file(ip is not nil, endpoint is not nil, ip and endpoint regex validations)
* Handle multiple log files analysis
```
