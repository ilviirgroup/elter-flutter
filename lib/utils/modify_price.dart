String modifyPrice(double price) {
  List splittedPrice = price.toStringAsFixed(1).split('.');
  if (splittedPrice.last != '0') {
    String _last = splittedPrice.last;
    splittedPrice.removeLast();
    splittedPrice.add(_last + '0');
    return splittedPrice.join('.') + ' TMT';
  }
  return splittedPrice.first + ' TMT';
}

double modifyOrderPrice(double price) {
  List splittedPrice = price.toStringAsFixed(1).split('.');
  if (splittedPrice.last != '0') {
    String _last = splittedPrice.last;
    splittedPrice.removeLast();
    splittedPrice.add(_last + '0');
    return double.parse(splittedPrice.join('.'));
  }
  return splittedPrice.first;
}
