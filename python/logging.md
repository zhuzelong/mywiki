:python:

# logging


## Components

1. `logging.Logger`: expose the interface to application code to generate log
2. `logging.Handler`: send the log to the appropriate destination
3. `logging.Filter`: determine which log to output
4. `logging.Formatter`: specify the layout of log in the final output


## Logger

> Loggers are never instantiated directly, but always via `logging.getLogger(name)`. The logger name is hierarchical, e.g. `foo.bar`.
