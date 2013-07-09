# configuer le produit ici
class mv_nagios::params {

	$packages = ["nagios3","sendemail","netcat"]
	$service_name = "nagios3"
	$config_path = "/etc/nagios3"
	$apache_www_directory = "/var/www"
}
