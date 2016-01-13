cask 'fantastical' do
  version '2.1.4'
  sha256 '7227933605ca7ef5618d8402ddff54cf19b83737a37d63c31d8c9ced2a6e76f4'

  url "http://cdn.flexibits.com/Fantastical_#{version}.zip"
  appcast 'https://flexibits.com/fantastical/appcast2.php',
          :checkpoint => 'f46d194dcae6cbf19e53ec03d6fddd2ec875ddd62e4754a7659c3bbbfb354219'
  name 'Fantastical'
  homepage 'https://flexibits.com/fantastical'
  license :freemium

  app 'Fantastical 2.app'

  postflight do
    suppress_move_to_applications
  end

  zap :delete => '~/Library/Preferences/com.flexibits.fantastical.plist'
end
