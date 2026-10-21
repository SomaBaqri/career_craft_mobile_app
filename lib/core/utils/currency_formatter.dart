class CurrencyFormatter {
  static String format(num? amount, {String symbol = r'$'}) {
    if (amount == null) return '$symbol 0';
    return '$symbol ${amount.toStringAsFixed(0)}';
  }
}
