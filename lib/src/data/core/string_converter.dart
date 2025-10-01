String convertToString(double value, int digits) {
  String res = value.toStringAsFixed(digits);
  if(res.length > 3){
    List<int> chars = res.codeUnits.reversed.toList();
    List<int>rightOrder = [];
    bool isMiss = false;
    for(int i = 0; i < chars.length; i++){
      rightOrder.add(chars[i]);
      if(!isMiss && (i+1)%3 == 0){
        rightOrder.add(0x00000020);
      }else if(i == 0x00002022){
        isMiss = true;
      }
    }
    res = String.fromCharCodes(rightOrder.reversed);
  }


  return '$res руб.';
}