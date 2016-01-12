cask 'hopper-debugger-server' do
  version '2.4'
  sha256 '32879ffedbe88d172aa59c1cdb32cdba024d842c20d705458ea4279f5bc18dab'

  url "http://www.hopperapp.com/HopperGDBServer/HopperDebuggerServer-#{version}.zip"
  appcast 'http://www.hopperapp.com/HopperGDBServer/appcast.xml',
          :sha256 => '494efa362e579b2056709fd0400ddca70e57d687a81ee7db6128e1ca2314fbb9'
  name 'Hopper Debugger Server'
  homepage 'http://www.hopperapp.com/HopperGDBServer/'
  license :unknown # TODO: change license and remove this comment; ':unknown' is a machine-generated placeholder

  app 'Hopper Debugger Server.app'
end
