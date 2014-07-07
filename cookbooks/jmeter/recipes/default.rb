include_recipe "java"

remote_file "#{Chef::Config[:file_cache_path]}/jmeter.tgz" do
  source "http://www.sai.msu.su/apache//jmeter/binaries/apache-jmeter-#{node['jmeter']['version']}.tgz"
  not_if { File.exists? "#{Chef::Config[:file_cache_path]}/jmeter.tgz" }
end

execute "extract jmeter" do
  cwd Chef::Config[:file_cache_path]
  command "tar -zxvf #{Chef::Config[:file_cache_path]}/jmeter.tgz"
  not_if { File.exists? "#{Chef::Config[:file_cache_path]}/apache-jmeter-#{node['jmeter']['version']}" }
end

execute "copy to lib" do
  cwd Chef::Config[:file_cache_path]
  command "cp -r apache-jmeter-#{node['jmeter']['version']} #{node['jmeter']['install_path']}"
  not_if { File.exists? node['jmeter']['install_path'] }
end  