cask 'knock' do
  version '2.1.5'
  sha256 '6dc272cc18e44ef06e27c4a7fc5a37f231904f3a436fdfd9e455c74829117426'

  # amazonaws.com is the official download host per the vendor homepage
  url 'https://knock-updates.s3.amazonaws.com/Knock.zip'
  appcast 'https://knock-updates.s3.amazonaws.com/Knock.xml',
          :checkpoint => '4adcd10cf5e9eba273b4c751f0fcb922c030d3235ee677e87547838ad73d3e55'
  name 'Knock'
  homepage 'http://knocktounlock.com'
  license :unknown # TODO: change license and remove this comment; ':unknown' is a machine-generated placeholder

  app 'Knock.app'
end
