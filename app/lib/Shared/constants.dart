import 'package:flutter/material.dart';

getAPPWidth(context,figmaWidth){
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