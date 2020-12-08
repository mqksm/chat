fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
### build_for_testing
```
fastlane build_for_testing
```
Install dependencies and build for testing
### run_tests
```
fastlane run_tests
```
Run tests without building
### build_and_test
```
fastlane build_and_test
```
Install dependencies, build and run tests
### discord_notification
```
fastlane discord_notification
```
Send discord notification

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
