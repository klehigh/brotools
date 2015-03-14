# brotools

A collection of scripts and tools for working with Bro.

- bro_field_counter.sh
  - provide an index of bro log fields.  automatically determines whether logs are gzip compressed and properly handles the log.  requires a valid Bro log header is present at beginning of log.

  - TODO:
    - add support for xz compressed logs
