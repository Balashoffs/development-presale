import 'package:presale/src/data/common/extensions/date.dart';

class OfferDayCounterDto {
  final DateTime _localDate;
  int _point;


  OfferDayCounterDto({required String localDate, required int point}):
  _localDate = DateTime.parse(localDate), _point = point;

  OfferDayCounterDto.now(): _localDate = DateTime.now(), _point = 0;


  void updatePoint() {
    _point++;
  }

  int get point => _point;
  String get localDate => '${_localDate.year}-${_localDate.month}-${_localDate.day}';


  bool isDayEqual() {
    return DateTime.now().dateOnly == _localDate;
  }

  String getOfferUniqNumber(OfferDayCounterDto value){
    return '${_localDate.day}${_localDate.month}${_localDate.year}-$_point';
  }

 static OfferDayCounterDto build(){
    return OfferDayCounterDto.now();
 }
}


