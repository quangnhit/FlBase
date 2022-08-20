import 'dart:math';
import 'package:intl/intl.dart';

extension CurrencyFormat on num {
  String formatPrice(
      {int decimalDigits = 2,
      bool convertToThounsand = false,
      bool trimBilion = false,
      bool getAbs = false,
      bool trimZero = false,
      bool zeroToEmpty = false,
      String endPoint = ''}) {
    num value = this;
    if (convertToThounsand) {
      value = value / 1000;
    }

    if (trimBilion) {
      value = value / 1000000000;
    }

    if (trimZero) {
      if (value == value.round().toDouble()) {
        // ignore: parameter_assignments
        decimalDigits = 0;
      }
    }

    if (zeroToEmpty && value == 0) {
      return '';
    }

    final NumberFormat format = NumberFormat.currency(
        locale: 'en-US', symbol: '', decimalDigits: decimalDigits);
    String abs = '';

    if (value > 0 && getAbs) {
      abs = '+';
    }

    return abs + format.format(value) + endPoint;
  }

  String formatVolume({
    int decimalDigits = 0,
    bool convertToThounsand = false,
    bool trimBilion = false,
    bool getAbs = false,

    /// If set to true, function will remove the .00 at the last of value
    /// Eg 69.00 -> 69
    bool trimZero = false,
    bool zeroToEmpty = false,
    bool convertAbcs = false,
  }) {
    num value = this;
    if (convertToThounsand) {
      value = value / 1000;
    }

    if (trimBilion) {
      value = value / 1000000000;
    }

    if (trimZero) {
      if (value == value.round().toDouble()) {
        // ignore: parameter_assignments
        decimalDigits = 0;
      }
    }

    if (zeroToEmpty && value == 0) {
      return '';
    }

    final NumberFormat format = NumberFormat.currency(
        locale: 'en-US', symbol: '', decimalDigits: decimalDigits);
    return format.format(value);
  }

  String formatRate(
    int decimalDigits, {
    bool getAbs = false,
  }) {
    int decDigitsToFormat = decimalDigits;

    final double roundVal = roundToDouble();
    if (roundVal == this) {
      decDigitsToFormat = 0;
    }

    final NumberFormat format = NumberFormat.currency(
        locale: 'en-US', symbol: '', decimalDigits: decDigitsToFormat);
    final String result = format.format(this);

    String abs = '';

    if (this > 0 && getAbs) {
      abs = '+';
    }

    return abs + result;
  }

  String formatHHMM() {
    final DateTime date = DateTime.fromMicrosecondsSinceEpoch(toInt() * 1000);
    final DateFormat dateFormat = DateFormat.Hm();
    return dateFormat.format(date);
  }

  String formatDMMYYYYHHMMSS() {
    final DateTime date = DateTime.fromMicrosecondsSinceEpoch(toInt() * 1000);

    return DateFormat('dd/MM/yyyy HH:MM:ss').format(date);
  }

  String formatDMMYYYYHH() {
    final DateTime date = DateTime.fromMicrosecondsSinceEpoch(toInt() * 1000);

    return DateFormat('dd/MM/yyyy HH:MM').format(date);
  }

  String formatTimeStampDMMYYYY() {
    final DateTime date = DateTime.fromMicrosecondsSinceEpoch(toInt() * 1000);

    return DateFormat('dd/MM/yyyy').format(date);
  }

  String formatDMMYYY() {
    final DateTime date = DateTime.fromMicrosecondsSinceEpoch(toInt() * 1000);

    return DateFormat('dd/MM/yy').format(date);
  }

  String formatDMMYYYY() {
    final DateTime date = DateTime.parse('$this');

    return DateFormat('dd/MM/yyyy').format(date);
  }

  bool isBetween(num? from, num? to) {
    return (from ?? 0) <= this && this <= (to ?? 0);
  }

  String get lessBeThanTen => this < 10 ? '0$this' : '$this';

  String formatToHHMM() {
    return DateFormat('HH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(toInt()));
  }

  String formatToHHMMSS() {
    return DateFormat('HH:mm:ss')
        .format(DateTime.fromMillisecondsSinceEpoch(toInt()));
  }

  String get getPrefix => this > 0 ? '+' : '';

  String getTimeDisp() {
    String matTimeSt = toStringAsFixed(0);

    if (matTimeSt.length != 5 && matTimeSt.length != 6) {
      return matTimeSt;
    }

    if (matTimeSt.length == 5) {
      matTimeSt = '0$matTimeSt';
    }

    // ignore: lines_longer_than_80_chars
    return '${matTimeSt.substring(0, 2)}:${matTimeSt.substring(2, 4)}:${matTimeSt.substring(4, 6)}';
  }

  num toPrecision(int n) {
    return num.parse(toStringAsFixed(n));
  }

  num truncateToDecimalPlaces(int? fractionalDigits) {
    if (fractionalDigits != null) {
      return (this * pow(10, fractionalDigits)).truncate() /
          pow(10, fractionalDigits);
    }
    return this;
  }

  num truncateToDecimalPlacesRound(int? fractionalDigits) {
    if (fractionalDigits != null) {
      final num a = (this * pow(10, fractionalDigits)).truncate() /
          pow(10, fractionalDigits);
      if (a == round()) {
        return round().toInt();
      } else {
        return a;
      }
    }

    return this;
  }
}

extension DoubleEx on double {}

extension IntegerEx on int {
  String formatToYYYYMMDD() {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(toInt());
    final DateFormat formatter = DateFormat('yyyy年MM月dd日');
    return formatter.format(dateTime);
  }
}
