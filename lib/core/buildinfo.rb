# buildinfo.rb
# Class for createing build info

module Core
  module Generater
    class BuildInfo
      def initialize(args, config, tub)
        @args = args
        @config = config
        @tub = tub
      end
      # TODO: Find way for jakhu.js to see this needs collapsing
      def create_build_info()
        @buildinfo = <<-SHELL
# Build info
echo Build System Infomation:
echo
# Bundle - ruby
echo bundle --version
bundle --version
echo
# coffee-script - javascript
echo coffee --version
coffee --version
echo
# g++ & gcc - cpp and cc
echo g++ --version
g++ --version
echo
echo gcc --version
gcc --version
echo
# Gem - ruby
echo gem --version
gem --version
echo
# Git - apt
echo git --version
git --version
echo
# java - apt
echo java --version
java --version
echo
# less - javascript
echo lessc --version
lessc --version
echo
# mvn - apt
echo mvn --version
mvn --version
echo
# les
# nodejs - nodejs
echo node --version
node --version
echo
# node-gyp - nodejs
echo node-gyp ---version
node-gyp --version
echo
# Npm - nodejs
echo npm --version
npm --version
echo
# Nvm - nodejs
echo nvm ---version
nvm --version
echo
# Python - python
echo python --version
python --version
echo
# pip - python
echo pip --version
pip --version
echo
# Pip - python
# Rails - ruby
echo rails --version
rails --version
echo
# Rvm - ruby
echo rvm --version
rvm --version
echo
# Ruby - ruby
echo ruby --version
ruby --version
echo
# sass - ruby
echo sass --version
sass --version
echo
# virtualenv - python
echo virtualenv --version
virtualenv --version
echo
        SHELL
        return @buildinfo
      end
    end
  end
end
