import 'package:intl/intl.dart';

final NumberFormat _priceFormatter = NumberFormat.decimalPattern('fa_IR');

String formatPrice(int price) {
  return _priceFormatter.format(price);
}
