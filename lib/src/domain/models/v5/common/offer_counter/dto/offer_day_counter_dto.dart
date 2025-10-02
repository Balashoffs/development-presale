import 'package:dart_date/dart_date.dart';
import 'package:date_format/date_format.dart';

class OfferDayCounterDTO {
  final int _timeStamp;
  int _point;

  OfferDayCounterDTO({required int timestamp, required int point})
    : _timeStamp = timestamp,
      _point = point;

  OfferDayCounterDTO.now() : _timeStamp = DateTime.now().millisecondsSinceEpoch, _point = 1;

  void updatePoint() {
    _point++;
  }

  int get point => _point;
  int get timeStamp => _timeStamp;

  DateTime get fromTimestamp => DateTime.fromMillisecondsSinceEpoch(_timeStamp);

  String get localDate => formatDate(fromTimestamp, [dd, ' ', mm, ' ', yyyy]);
  String get onlyNumbers => formatDate(fromTimestamp, [dd, mm, yyyy]);

  bool isDayEqual() {
    DateTime now = DateTime.now();
    return now.getDayOfYear==fromTimestamp.getDayOfYear;
  }

  String getOfferUniqueNumber() {
    return '$onlyNumbers-$_point';
  }

  @override
  String toString() {
    return 'timestamp: $_timeStamp, point: $_point';
  }
}
