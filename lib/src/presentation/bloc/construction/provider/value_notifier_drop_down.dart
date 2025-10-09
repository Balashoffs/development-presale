import 'package:flutter/foundation.dart';

class ValueNotifierDropDown extends ChangeNotifier {
  bool _showMenu;

  bool get showMenu => _showMenu;

  final List<String> _inputData;
  List<String> _forSelecting = [];

  ValueNotifierDropDown({required List<String> inputData})
    : _inputData = inputData,
      _showMenu = false,
      _current = inputData.first {
    _forSelecting = _calc;
  }

  String _current;

  String get current => _current;

  List<String> get items => _forSelecting;

  List<String> get _calc =>
      _inputData.where((element) => element != _current).toList();

  void selected(String value) {
    _current = value;
    _forSelecting = _calc;
    _showMenu = false;
    notifyListeners();
  }

  void onTap() {
    _showMenu = !_showMenu;
    notifyListeners();
  }

  void tapOutside() {
    _showMenu = false;
    notifyListeners();
  }
}
