# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include winsql2017v3::mssql
class winsql2017v4::mssql (
  # See http://msdn.microsoft.com/en-us/library/ms144259.aspx
  # Media is required to install
  $media          = 'c:\temp\sql2017',
  $instancename   = 'MSSQLSERVER',
  #$instancedir    = $mssql::params::instancedir,
  #$ascollation    = $mssql::params::ascollation,
  #$sqlcollation   = $mssql::params::sqlcollation,
  #$admin          = $mssql::params::admin,
) inherits winsql2017v4::params {

  #User {
   # ensure   => present,
    #before => Exec['install_mssql2017'],
  #}


 # file { 'C:/temp/sql2017/setup.exe':
  
 #   content =>template('C:/ProgramData/PuppetLabs/code/environments/test/modules/winsql2017v3/templates/configuration.ini.erb'),
 # }

  exec { 'install_mssql2017':
    command   => "${media}\\setup.exe /Action=Install /IACCEPTSQLSERVERLICENSETERMS /QS /CONFIGURATIONFILE=C:/temp/sql2017/ConfigurationFile.ini",
    cwd       => $media,
    path      => $media,
    logoutput => true,
    creates   => $instancedir,
    timeout   => 1200,
    #require   => File['puppet://modules/winsql2017v3/ConfigurationFile.ini'],
  }
}