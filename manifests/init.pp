class mv_nagios inherits mv_nagios::params {
	include mv_nagios::packages
	include mv_nagios::config
	include mv_nagios::service
}
