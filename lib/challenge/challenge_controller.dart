import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentePageNofifier = ValueNotifier<int>(1);
  int get currentPage => currentePageNofifier.value;
  set currentPage(int value) => currentePageNofifier.value = value;
}
