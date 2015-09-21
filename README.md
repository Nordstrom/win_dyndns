# win_dyndns

## Description

This is a resource cookbook that hosts a LWRP that supports configuration of
Windows dynamic DNS updates with the following (string) action:
* action :set (default)
* setting 'True' (default) or 'False'

## Usage

win_dyndns 'default' do
  setting 'True'
end

## WARNING

* This cookbook only validated on single-NIC systems.

## Author

* Dave Viebrock
* Nordstrom, Inc.

## License

Copyright (c) 2015 Nordstrom, Inc., All Rights Reserved.
