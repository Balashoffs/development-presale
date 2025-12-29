import 'package:collection/collection.dart';

enum ColonType {
  UNDEF,
  EST,
  LIIS;

  static ColonType find(String value) {
    return ColonType.values.firstWhereOrNull(
          (element) => element.name.toLowerCase() == value.toLowerCase(),
        ) ??
        ColonType.UNDEF;
  }
}
