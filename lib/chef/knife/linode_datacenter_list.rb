
# Author:: Adam Jacob (<adam@chef.io>)
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Author:: Lamont Granquist (<lamont@chef.io>)
# Copyright:: Copyright (c) 2010-2016 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "chef/knife/linode_base"

class Chef
  class Knife
    class LinodeDatacenterList < Chef::Knife

      include Knife::LinodeBase

      banner "knife linode datacenter list (options)"

      def run
        validate!
        server_list = [
          ui.color("ID", :bold),
          ui.color("Location", :bold),
        ]

        connection.data_centers.each do |datacenter|
          server_list << datacenter.id.to_s
          server_list << datacenter.location
        end

        puts ui.list(server_list, :columns_across, 2)
      end
    end
  end
end
