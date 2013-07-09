class mv_nagios::service {

	service { "mv_nagios":
		name => $mv_nagios::service_name,
		ensure => running,
		require => Package["mv_nagios"],
	}
}
