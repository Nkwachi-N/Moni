import 'dart:io' show Platform;
import 'package:intl/intl.dart' show NumberFormat;

final currency = NumberFormat.simpleCurrency(
  locale: Platform.localeName,
  name: 'NGN',
  decimalDigits: 0,
);