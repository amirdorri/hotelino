import 'package:intl/intl.dart';

String formatPrice(int price) {
  final formatter = NumberFormat.decimalPattern('fa');
  return formatter.format(price);
}