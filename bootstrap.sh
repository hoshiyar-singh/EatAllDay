#!/usr/bin/env bash

# Exits on error
set -e

echo -n "⚠️     Prerequisite: Xcode tools and Homebrew should be installed before running this script."
echo -n "⚠️     Make sure you have ssh keys installed for github."
echo -n "⚠️     Make sure you have MATCH_PASSWORD set in ~/.bash_profile"

# Set github to use ssh
echo -n "Step: Setting git urls to use git@github.com instead of https://github.com/"
git config --global --add url."git@github.com:".insteadOf "https://github.com/"

echo -n "Step: Looking for Homebrew... "
if [[ $(command -v brew) == "" ]]; then
  echo "❌"
  echo -n "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "👍"
fi

# Check for bundler
echo -n "Step: Looking for Bundler... "
if ! which bundler >& /dev/null; then
echo "❌"
echo -n "Installing bundler"
gem install bundler
else
echo "👍"
fi

# Checks for Carthage and tries to install via homebrew
echo -n "Step: Looking for Carthage... "
if ! which carthage >& /dev/null; then
    echo "❌"
    echo "Could not find Carthage. Trying to install via Homebrew"
    if which brew >& /dev/null; then
        brew install carthage
    else
        echo "Could not install Carthage via homebrew. Please install manually to proceed"
        exit 1
    fi
else
    echo "👍"
fi

# Checks for Swiftlint and tries to install via homebrew
echo -n "Step: Looking for Swiftlint... "
if ! which swiftlint >& /dev/null; then
    echo "❌"
    echo "Could not find Swiftlint. Trying to install via Homebrew"
    if which brew >& /dev/null; then
        brew install swiftlint
    else
        echo "Could not install Swiftlint via homebrew. Please install manually to proceed"
        exit 1
    fi
else
    echo "👍"
fi

# Checks for Swiftformat and tries to install via homebrew
echo -n "Step: Looking for Swiftformat... "
if ! which swiftformat >& /dev/null; then
    echo "❌"
    echo "Could not find Swiftformat. Trying to install via Homebrew"
    if which brew >& /dev/null; then
        brew install swiftformat
    else
        echo "Could not install Swiftformat via homebrew. Please install manually to proceed"
        exit 1
    fi
else
    echo "👍"
fi

# Install gems and compile frameworks
echo -n "Step: Installings gems"
bundle install
echo -n "Step: Compiling frameworks"
carthage bootstrap --platform ios --cache-builds --no-use-binaries --new-resolver

echo -n "✅   You are all setup up. Happy Coding !!"
