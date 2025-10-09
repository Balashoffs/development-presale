import 'package:flutter/cupertino.dart';
import 'package:moon_design/moon_design.dart';


void showToast(BuildContext context, String text){
  MoonToast.show(
    context,
    isPersistent: false,
    useSafeArea: false,
    width: 196,
    toastAlignment: Alignment.bottomCenter,
    variant: MoonToastVariant.original,
    displayDuration: Duration(seconds: 3),
    borderRadius: BorderRadius.circular(8.toDouble()),
    leading: Icon(
      MoonIcons.generic_info_24_light,
    ),
    label: Text(
      text,
    ),
  );
}

void showToastWithoutContext(BuildContext context, String text){
  MoonToast.show(
    context,
    isPersistent: false,
    useSafeArea: false,
    width: 230,
    toastAlignment: Alignment.bottomCenter,
    variant: MoonToastVariant.original,
    displayDuration: Duration(seconds: 3),
    borderRadius: BorderRadius.circular(8.toDouble()),
    leading: Icon(
      MoonIcons.generic_info_24_light,
    ),
    label: Text(
      text,
    ),
    trailing: Icon(
      MoonIcons.generic_star_24_light,
    ),
  );
}