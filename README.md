# brotools

A collection of scripts and tools for working with Bro.

- bro_field_counter.sh
  - provide an index of bro log fields.  automatically determines whether logs are gzip compressed and properly handles the log.  requires a valid Bro log header is present at beginning of log.
  - install by copying into a directory that is likely to be in the PATH of your users.

  - TODO:
    - add support for xz compressed logs

Repo TODO:
  - maybe I should add a Makefile to support installing stuff.
  - I should probably add more tools so the plural repo name is valid.
