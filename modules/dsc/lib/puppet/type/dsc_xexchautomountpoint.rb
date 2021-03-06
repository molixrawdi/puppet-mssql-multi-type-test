require 'pathname'

Puppet::Type.newtype(:dsc_xexchautomountpoint) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchAutoMountPoint resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchAutoMountPoint/MSFT_xExchAutoMountPoint.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchAutoMountPoint' end
  def dscmeta_resource_name; 'MSFT_xExchAutoMountPoint' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.19.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         PsDscRunAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_psdscrunascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "PsDscRunAsCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Identity"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AutoDagDatabasesRootFolderPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagdatabasesrootfolderpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutoDagDatabasesRootFolderPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AutoDagVolumesRootFolderPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagvolumesrootfolderpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutoDagVolumesRootFolderPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DiskToDBMap
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disktodbmap, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DiskToDBMap"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         SpareVolumeCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sparevolumecount) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SpareVolumeCount"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EnsureExchangeVolumeMountPointIsLast
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ensureexchangevolumemountpointislast) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnsureExchangeVolumeMountPointIsLast"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CreateSubfolders
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_createsubfolders) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CreateSubfolders"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         FileSystem
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NTFS", "REFS"]
  newparam(:dsc_filesystem) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FileSystem - Valid values are NTFS, REFS."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NTFS', 'ntfs', 'REFS', 'refs'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NTFS, REFS")
      end
    end
  end

  # Name:         MinDiskSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mindisksize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MinDiskSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PartitioningScheme
  # Type:         string
  # IsMandatory:  False
  # Values:       ["MBR", "GPT"]
  newparam(:dsc_partitioningscheme) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PartitioningScheme - Valid values are MBR, GPT."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['MBR', 'mbr', 'GPT', 'gpt'].include?(value)
        fail("Invalid value '#{value}'. Valid values are MBR, GPT")
      end
    end
  end

  # Name:         UnitSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_unitsize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UnitSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         VolumePrefix
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_volumeprefix) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VolumePrefix"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xexchautomountpoint).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
