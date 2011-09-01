
# Author:: Adam Jacob (<adam@opscode.com>)
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Author:: Lamont Granquist (<lamont@opscode.com>)
# Copyright:: Copyright (c) 2010-2011 Opscode, Inc.
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

# requires ruby 1.9.2

class Chef
  class Knife
    class LinodeServerCreate < Chef::Knife

      include Knife::LinodeBase

      banner "knife linode server create (options)"

      def run

        validate!
        datacenter = connection.data_centers.select { |dc| dc.id == 3 }.first
        pp datacenter
        flavor = connection.flavors.get(1)
        pp flavor
        image = connection.images.get(83)
        pp image
        kernel = connection.kernels.get(133)
        pp kernel

        connection.servers.create(:data_center => datacenter, :flavor => flavor, :image => image, :kernel => kernel, :type => "ext3", :payment_terms => 1, :stack_script => nil , :name => "foo", :password => "BarbaZ")

      end
    end
  end
end
