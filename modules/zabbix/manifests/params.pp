class zabbix::params {
  $pkg_agent             = 'zabbix-agent'
  $pkg_server            = 'zabbix-server'

  $agent_srv             = 'zabbix-agent'
  $server_srv            = 'zabbix-server'

  $zabbix_config_dir     = '/etc/zabbix'
  $zabbix_user_home_dir  = '/var/lib/zabbix'
  $zabbix_log_dir        = '/var/log/zabbix'
  $zabbix_pid_dir        = '/var/run/zabbix'
  $zabbix_user_param_dir = '/etc/zabbix/zabbix_agentd.d'

  $zabbix_user           = 'zabbix'
  $zabbix_group          = 'zabbix'

  case $::osfamily {
    'RedHat' : {
      $repo = 'http://repo.zabbix.com/zabbix/2.0/rhel/6/x86_64/zabbix-release-2.0-1.el6.noarch.rpm'

      case $::operatingsystem {
        'CentOS', 'Scientific' : {
          $repofile             = '/etc/yum.repos.d/zabbix.repo'
          $install_repo_command = "yum install -y ${repo}"
          $restart_command      = '/etc/init.d/zabbix-agent restart'
          $agent_conf_file      = '/etc/zabbix/zabbix_agentd.conf'
        }
        'Fedora'               : {
          $repofile             = '/etc/yum.repos.d/fedora.repo'
          $install_repo_command = 'echo'
          $restart_command      = 'systemctl restart zabbix-agent'
          $agent_conf_file      = '/etc/zabbix_agentd.conf'
        }
        default                : {
          fail('Unsupported OS')
        }
      }

    }

    'Debian' : {
      case $::operatingsystem {
        'Ubuntu' : {
          $repo = $::lsbdistcodename ? {
            /precise/ => 'http://repo.zabbix.com/zabbix/2.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.0-1precise_all.deb',
            /lucid/   => 'http://repo.zabbix.com/zabbix/2.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.0-1lucid_all.deb',
            default   => ''
          } }
        'Debian' : {
          case $::lsbdistcodename {
            'jessie'  : {
              $repo     = ''
              $repofile = '/etc/apt/sources.list'
            }
            'wheezy'  : {
              $repo     = 'http://repo.zabbix.com/zabbix/2.0/debian/pool/main/z/zabbix-release/zabbix-release_2.0-1wheezy_all.deb'
              $repofile = '/etc/apt/sources.list.d/zabbix.list'
            }
            'squeeze' : {
              $repo     = 'http://repo.zabbix.com/zabbix/2.0/debian/pool/main/z/zabbix-release/zabbix-release_2.0-1squeeze_all.deb'
              $repofile = '/etc/apt/sources.list.d/zabbix.list'
            }
            default   : {
              fail('Unsupported release')
            }
          }
        }
        default  : {
          fail('Unsupported release')
        }
      }
      $install_repo_command = "dpkg -i ${repo}"
      $restart_command      = '/etc/init.d/zabbix-agent restart'
      $agent_conf_file      = '/etc/zabbix/zabbix_agentd.conf'
    }
  }

}

