require 'test_helper'

describe Cask::Installer do
  describe "install" do
    it "downloads and installs a nice fresh Cask" do
      caffeine = Cask.load('local-caffeine')

      shutup do
        Cask::Installer.new(caffeine).install
      end

      dest_path = Cask.caskroom/'local-caffeine'/caffeine.version
      dest_path.must_be :directory?
      application = dest_path/'Caffeine.app'
      application.must_be :directory?
    end

    it "works with dmg-based casks" do
      transmission = Cask.load('local-transmission')

      shutup do
        Cask::Installer.new(transmission).install
      end

      dest_path = Cask.caskroom/'local-transmission'/transmission.version
      dest_path.must_be :directory?
      application = dest_path/'Transmission.app'
      application.must_be :directory?
    end

    it "works with tar-based casks" do
      tarball = Cask.load('tarball')

      shutup do
        Cask::Installer.new(tarball).install
      end

      dest_path = Cask.caskroom/'tarball'/tarball.version
      dest_path.must_be :directory?
      application = dest_path/'Tarball.app'
      application.must_be :directory?
    end

    it "works with cab-based casks" do
      skip unless HOMEBREW_PREFIX.join('bin/cabextract').exist?
      cab_container = Cask.load('cab-container')
      cab_container.stubs(:depends_on_formula).returns([])

      shutup do
        Cask::Installer.new(cab_container).install
      end

      dest_path = Cask.caskroom/'cab-container'/cab_container.version
      dest_path.must_be :directory?
      application = dest_path/'cabcontainer/Application.app'
      application.must_be :directory?
    end

    it "works with Adobe AIR-based Casks" do
      skip unless Pathname('/Applications/Utilities/Adobe AIR Application Installer.app/Contents/MacOS/Adobe AIR Application Installer').exist?
      air_container = Cask.load('adobe-air-container')
      shutup do
        Cask::Installer.new(air_container).install
      end
      dest_path = Cask.caskroom/'adobe-air-container'/air_container.version
      dest_path.must_be :directory?
      application = dest_path/'GMDesk.app'
      application.must_be :directory?
    end

    it "works with 7z-based casks" do
      skip unless HOMEBREW_PREFIX.join('bin/unar').exist?
      sevenzip_container = Cask.load('sevenzip-container')
      sevenzip_container.stubs(:depends_on_formula).returns([])

      shutup do
        Cask::Installer.new(sevenzip_container).install
      end

      dest_path = Cask.caskroom/'sevenzip-container'/sevenzip_container.version
      dest_path.must_be :directory?
      application = dest_path/'sevenzipcontainer/Application.app'
      application.must_be :directory?
    end

    it "works with Stuffit-based Casks" do
      skip unless HOMEBREW_PREFIX.join('bin/unar').exist?
      stuffit_container = Cask.load('stuffit-container')
      stuffit_container.stubs(:depends_on_formula).returns([])

      shutup do
        Cask::Installer.new(stuffit_container).install
      end

      dest_path = Cask.caskroom/'stuffit-container'/stuffit_container.version
      dest_path.must_be :directory?
      application = dest_path/'sheldonmac/v1.0'
      application.must_be :directory?
    end

    it "works with RAR-based casks" do
      skip unless HOMEBREW_PREFIX.join('bin/unar').exist?
      rar_container = Cask.load('rar-container')
      rar_container.stubs(:depends_on_formula).returns([])

      shutup do
        Cask::Installer.new(rar_container).install
      end

      dest_path = Cask.caskroom/'rar-container'/rar_container.version
      dest_path.must_be :directory?
      application = dest_path/'rarcontainer/Application.app'
      application.must_be :directory?
    end

    it "works with bz2-based casks" do
      asset = Cask.load('bzipped-asset')

      shutup do
        Cask::Installer.new(asset).install
      end

      dest_path = Cask.caskroom/'bzipped-asset'/asset.version
      dest_path.must_be :directory?
      file = dest_path/"bzipped-asset-#{asset.version}"
      file.must_be :file?
    end

    it "blows up on a bad checksum" do
      bad_checksum = Cask.load('bad-checksum')
      lambda {
        shutup do
          Cask::Installer.new(bad_checksum).install
        end
      }.must_raise(ChecksumMismatchError)
    end

    it "blows up on a missing checksum" do
      missing_checksum = Cask.load('missing-checksum')
      lambda {
        shutup do
          Cask::Installer.new(missing_checksum).install
        end
      }.must_raise(ChecksumMissingError)
    end

    it "installs fine if no_checksum is included in cask" do
      no_checksum = Cask.load('no-checksum')
      shutup do
        Cask::Installer.new(no_checksum).install
      end
      no_checksum.must_be :installed?
    end

    it "prints caveats if they're present" do
      with_caveats = Cask.load('with-caveats')
      TestHelper.must_output(self, lambda {
        Cask::Installer.new(with_caveats).install
      }, /Here are some things you might want to know/)
      with_caveats.must_be :installed?
    end

    it "does not extract __MACOSX directories from zips" do
      with_macosx_dir = Cask.load('with-macosx-dir')
      shutup do
        Cask::Installer.new(with_macosx_dir).install
      end
      with_macosx_dir.destination_path.join('__MACOSX').wont_be :directory?
    end

    it "prevents already installed casks from being installed" do
      transmission = Cask.load('local-transmission')
      transmission.installed?.must_equal false
      installer = Cask::Installer.new(transmission)

      shutup { installer.install }
      lambda {
        shutup { installer.install }
      }.must_raise(CaskAlreadyInstalledError)
    end

    it "allows already installed casks to being installed if force is provided" do
      transmission = Cask.load('local-transmission')
      transmission.installed?.must_equal false
      installer = Cask::Installer.new(transmission)

      shutup { installer.install }
      shutup {
        installer.install(true)
      } # wont_raise
    end

    it "works properly with a direct link to a pkg" do
      naked_pkg = Cask.load('naked-pkg')

      shutup do
        Cask::Installer.new(naked_pkg).install
      end

      dest_path = Cask.caskroom/'naked-pkg'/naked_pkg.version
      pkg = dest_path/'Naked.pkg'
      pkg.must_be :file?
    end

    it "works properly with an overridden container_type" do
      naked_executable = Cask.load('naked-executable')

      shutup do
        Cask::Installer.new(naked_executable).install
      end

      dest_path = Cask.caskroom/'naked-executable'/naked_executable.version
      executable = dest_path/'naked_executable'
      executable.must_be :file?
    end

    it "works fine with a nested container" do
      nested_app = Cask.load('nested-app')

      shutup do
        Cask::Installer.new(nested_app).install
      end

      dest_path = Cask.appdir/'MyNestedApp.app'
      TestHelper.valid_alias?(dest_path).must_equal true
    end
  end

  describe "uninstall" do
    it "fully uninstalls a cask" do
      caffeine = Cask.load('local-caffeine')
      installer = Cask::Installer.new(caffeine)

      shutup do
        installer.install
        installer.uninstall
      end

      (Cask.caskroom/'local-caffeine'/caffeine.version/'Caffeine.app').wont_be :directory?
      (Cask.caskroom/'local-caffeine'/caffeine.version).wont_be :directory?
      (Cask.caskroom/'local-caffeine').wont_be :directory?
    end
  end
end
