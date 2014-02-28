case node["platform"]
when "ubuntu"
  node.set["growthforecast"]["install_pkgs"] = %w{build-essential cpanminus libxml2-dev libcairo2-dev libpango1.0-dev}

when "centos", "redhat"
  execute "slapadd" do
    command "yum groupinstall 'Development Tools'"
    action :run
  end
  node.set["growthforecast"]["install_pkgs"] = %w{pkgconfig glib2-devel gettext libxml2-devel pango-devel cairo-devel}

when "mac_os_x"
  node.set["growthforecast"]["install_pkgs"] = %w{pkgconfig gettext glib libxml2 pango cairo}
end

default["growthforecast"]["version"] = "0.81"
