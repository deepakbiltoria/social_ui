import 'package:flutter/cupertino.dart';

class Images {
  static AssetImage getter(String imageName) {
    return AssetImage('assets/images/${imageName}.jpg');
  }
}
