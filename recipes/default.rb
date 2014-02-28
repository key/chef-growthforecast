#
# Cookbook Name:: chef-growthforecast
# Recipe:: default
#
# Copyright 2012, Kentaro Kuribayashi
#

node["growthforecast"]["install_pkgs"].each do |p|
  package p
end

VERSION = node["growthforecast"]["version"]

execute "cpanm" do
  command "cpanm -n http://cpan.metacpan.org/authors/id/K/KA/KAZEBURO/GrowthForecast-#{VERSION}.tar.gz"
  action :run
end
