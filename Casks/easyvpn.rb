cask 'easyvpn' do
  version '1.6'
  sha256 '4ece3c25ea7fb03340603caf3bef3454a08d0e1a7e89dead87bb53ca1631ca40'

  url "http://www.squashedsoftware.com/downloads/easyVPN_#{version}.zip"
  appcast 'http://www.squashedsoftware.com/appcasts/easyvpn.xml',
          :checkpoint => 'd4e71c0b530a0128249446d3333e709d4ae45fd7bed9e3c9aeaa92881b79e1ef'
  name 'EasyVPN'
  homepage 'http://www.squashedsoftware.com/products-easyvpn.php'
  license :commercial

  app 'EasyVPN.app'
end
