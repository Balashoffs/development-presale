run### Flutter version
Flutter 3.35.1 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 20f8274939 (7 месяцев назад) • 2025-08-14 10:53:09 -0700
Engine • hash 6cd51c08a88e7bbe848a762c20ad3ecb8b063c0e (revision 1e9a811bf8) (6 months ago) • 2025-08-13 23:35:25.000Z
Tools • Dart 3.9.0 • DevTools 2.48.0

### Build docker image 
#### Develop image
```bash
 ./scripts/build_image_dev.sh [x1.y1.z1] [x2.y2.z2]
```
- [x1.y1.z1] - previous version
- [x2.y2.z2] - next version

#### Production image
```bash
 ./scripts/build_image_prod.sh [x1.y1.z1] [x2.y2.z2]
```
- [x1.y1.z1] - previous version
- [x2.y2.z2] - next version

### Run with dart define
--dart-define-from-file=.env/.develop.json - for develop
--dart-define-from-file=.env/.production.json - for production

