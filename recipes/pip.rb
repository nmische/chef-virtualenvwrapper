#
# Cookbook Name:: virtualenvwrapper
# Recipe:: pip
#
# Copyright 2014, NATHAN MISCHE
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

python_pip "virtualenvwrapper"

ruby_block "update_bashrc" do
  block do
    Dir.glob("/home/**/.bashrc") do |filename|
        file = Chef::Util::FileEdit.new(filename)
        file.insert_line_if_no_match("/source \/usr\/local\/bin\/virtualenvwrapper.sh/", "source /usr/local/bin/virtualenvwrapper.sh")
        file.write_file
    end
  end
  only_if { node['virtualenvwrapper']['pip']['update_bashrc'] }
end