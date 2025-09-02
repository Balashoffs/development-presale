### Flutter version
Flutter 3.32.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision be698c48a6 (3 месяца назад)
Engine • revision 1881800949 (3 месяца назад)
Tools • Dart 3.8.0 • DevTools 2.45.1

### Build docker image 
## at mac os m2
see .script/build_image.sh to build
see .script/run_image.sh to run

### Macos build
flutter build macos --release 


### Run with dart define
--dart-define-from-file=env/develop.json - for develop
--dart-define-from-file=env/production.json - for production

