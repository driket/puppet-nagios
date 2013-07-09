class mv_nagios::packages {
	require('mv_nagios::params')

	package {"mv_nagios":
		name => $mv_nagios::packages,
		ensure => present,
	}
	package {"wget":
		ensure => present,
 	}

}
