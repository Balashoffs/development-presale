import 'package:flutter/foundation.dart';

class DropDownTextController extends ChangeNotifier {
  bool _showMenu;


  bool get showMenu => _showMenu;
  bool _isLeading = true;
  bool get isLeading => _isLeading;

  final List<String> _inputData;

  DropDownTextController({required List<String> inputData})
    : _inputData = inputData,
      _showMenu = false,
      _current = '';

  String _current;

  String get current => _current;

  List<String> get items => _calc;

  List<String> get _calc =>
      _inputData.where((element) => element != _current).toList();

  void selected(String value) {
    _current = value;
    _showMenu = false;
    _isLeading = false;
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


