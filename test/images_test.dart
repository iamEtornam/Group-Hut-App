import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:group_hut/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(true, File(Images.image8).existsSync());
    expect(true, File(Images.image2).existsSync());
    expect(true, File(Images.image3).existsSync());
    expect(true, File(Images.image1).existsSync());
    expect(true, File(Images.image4).existsSync());
    expect(true, File(Images.image5).existsSync());
    expect(true, File(Images.image7).existsSync());
    expect(true, File(Images.image6).existsSync());
  });
}
