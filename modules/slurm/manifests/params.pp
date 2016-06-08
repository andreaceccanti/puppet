class slurm::params {
  case $::osfamily {
    'RedHat' : {
      $share_dir      = '/usr/share/slurm'
      $spool_dir      = '/var/spool/slurmctld'
      $log_dir        = '/var/log/slurm'
      $service_name   = 'slurm'

      $conf_dir       = "${share_dir}/etc"
      $init_script    = '/etc/init.d/slurm'
      $profile_script = '/etc/profile.d/slurm.sh'
    }
    'Debian' : {
      $spool_dir    = '/var/spool/slurmd'
      $log_dir      = '/var/log/slurm'
      $service_name = 'slurm-llnl'
      $pkg_name     = 'slurm-llnl'

      $conf_dir     = '/etc/slurm-llnl'
    }
  }

  $slurm_user     = 'slurm'
  $slurm_group    = 'slurm'
  $slurm_uid      = 64030
  $slurm_gid      = 64030

  $conf_file      = "${conf_dir}/slurm.conf"
  $logrotate_conf = '/etc/logrotate.d/slurm'

}
