# win_dyndns

## Description

This is a resource cookbook that hosts a LWRP that supports configuration of
Windows dynamic DNS updates with the following (string) actions:
* enable (default)
* disable

## Usage


win_dyndns 'default' do
  action :enable
end

## WARNING

* This cookbook only works on single-NIC systems, and exits with a zero status
* if more than one NIC is found.

## Author

* Dave Viebrock
* Nordstrom, Inc.

## License

Copyright (c) 2015 Nordstrom, Inc., All Rights Reserved.
