cask 'hockey' do
  version :latest
  sha256 :no_check

  url 'https://rink.hockeyapp.net/api/2/apps/67503a7926431872c4b6c1549f5bd6b1?format=zip'
  appcast 'https://rink.hockeyapp.net/api/2/apps/67503a7926431872c4b6c1549f5bd6b1',
          :checkpoint => 'd83c32dc41ea9d91733f6fa06a36090e9041fe99779e1011108b8af1c5c4c058'
  name 'HockeyApp'
  homepage 'http://hockeyapp.net/releases/mac/'
  license :unknown # TODO: change license and remove this comment; ':unknown' is a machine-generated placeholder

  app 'HockeyApp.app'
  binary 'HockeyApp.app/Contents/Resources/puck'

  postflight do
    suppress_move_to_applications
  end
end
