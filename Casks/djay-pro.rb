cask 'djay-pro' do
  version '1.2.1,201510081831'
  sha256 '08c9cf2961834eb7dd4605d9d7ada7461f8bf9af7b80e48d71f13b1bd580a8ca'

  url "http://download.algoriddim.com/djay/#{version.after_comma}/djay_Pro_#{version.before_comma}.zip"
  appcast 'https://www.algoriddim.com/djay-pro-mac/releasenotes/appcast',
          :checkpoint => '75157f32b04cd35158b9f1f2fe52ddd1a63dc4667b42d9ea67befaa13a5a3660'
  name 'Algoriddim djay Pro'
  homepage 'http://algoriddim.com/djay-mac'
  license :commercial

  app 'djay Pro.app'
end
