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

* Nordstrom, Inc.

## License

Copyright 2015 Nordstrom, Inc.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
