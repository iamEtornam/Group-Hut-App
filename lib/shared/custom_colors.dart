import 'package:flutter/widgets.dart';

final Color primaryColor = Color.fromRGBO(28, 18, 89, 1);
final Color accentColor = Color.fromRGBO(125, 108, 215, 1);

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

List<Color> gradientColors() {
  final colors = [
    fromHex('#673cf5'),
    fromHex('#8a40eb'),
    fromHex('#a248e2'),
    fromHex('#b551d9'),
    fromHex('#c35dd2'),
  ];
  colors.shuffle();
  return colors;
}
