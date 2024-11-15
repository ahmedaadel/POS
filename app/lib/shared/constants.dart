import 'package:flutter/material.dart';

Color defaultGreyColor=const Color(0x80000000);
Color defaultYellowColor=const Color(0xffFFEA00);


getAppWidth(context,figmaWidth){
  return (MediaQuery.of(context).size.width)*figmaWidth/360;
}
getAppHeight(context,figmaHeight){
  return ((MediaQuery.of(context).size.height)*figmaHeight/800);
}
getAppSize(context,figmaSize){
  var ratio=figmaSize/(360*800);
  var myApp=(MediaQuery.of(context).size.height)*(MediaQuery.of(context).size.width);
  return (myApp*ratio);
}