cask :v1 => '1password' do

  if MacOS.release <= :lion
    version '3.8.22'
    sha256 '3afd75f1bddf791dc7dbc9a7d92ab6eb91ee891407d750cedb7b5aff5fe8bf17'

    url "http://i.agilebits.com/dist/1P/mac/1Password-#{version}.zip"

    app '1Password.app'
  elsif MacOS.release <= :mavericks
    version '4.4.3'
    sha256 '6657fc9192b67dde63fa9f67b344dc3bc6b7ff3e501d3dbe0f5712a41d8ee428'

    url "http://i.agilebits.com/dist/1P/mac4/1Password-#{version}.zip"

    app "1Password #{version.to_i}.app"
  else
    version '5.3'
    sha256 'cad96e27ca1f78fa660e49fa5bff4e4366443d9f0c65b4f5f28e442c75a0a8be'

    url "http://i.agilebits.com/dist/1P/mac4/1Password-#{version}.zip"

    app "1Password #{version.to_i}.app"
  end

  name '1Password'
  homepage 'https://agilebits.com/onepassword'
  license :commercial

  zap :delete => [
                  '~/Library/Application Scripts/2BUA8C4S2C.com.agilebits.onepassword-osx-helper',
                  '~/Library/Containers/2BUA8C4S2C.com.agilebits.onepassword-osx-helper',
                  '~/Library/Containers/com.agilebits.onepassword-osx',
                  '~/Library/Group Containers/2BUA8C4S2C.com.agilebits',
                 ]
end
