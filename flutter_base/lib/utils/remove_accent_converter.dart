import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class RemoveAccentConverter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String newText = ConvertHelper.removeAccents(newValue.text);
    return TextEditingValue(text: newText, selection: newValue.selection);
  }
}

class ConvertHelper {
  static const List<String> _accentChars = <String>[
    'á',
    'à',
    'ả',
    'ã',
    'ạ',
    'ă',
    'ắ',
    'ằ',
    'ẳ',
    'ẵ',
    'ặ',
    'â',
    'ấ',
    'ầ',
    'ẩ',
    'ẫ',
    'ậ',
    'đ',
    'é',
    'è',
    'ẻ',
    'ẽ',
    'ẹ',
    'ê',
    'ế',
    'ề',
    'ể',
    'ễ',
    'ệ',
    'í',
    'ì',
    'ỉ',
    'ĩ',
    'ị',
    'ó',
    'ò',
    'ỏ',
    'õ',
    'ọ',
    'ô',
    'ố',
    'ồ',
    'ổ',
    'ỗ',
    'ộ',
    'ơ',
    'ớ',
    'ờ',
    'ở',
    'ỡ',
    'ợ',
    'ú',
    'ù',
    'ủ',
    'ũ',
    'ụ',
    'ư',
    'ứ',
    'ừ',
    'ử',
    'ữ',
    'ự',
    'ý',
    'ỳ',
    'ỷ',
    'ỹ',
    'ỵ',
    'Á',
    'À',
    'Ả',
    'Ã',
    'Ạ',
    'Ă',
    'Ắ',
    'Ằ',
    'Ẳ',
    'Ẵ',
    'Ặ',
    'Â',
    'Ấ',
    'Ầ',
    'Ẩ',
    'Ẫ',
    'Ậ',
    'Đ',
    'É',
    'È',
    'Ẻ',
    'Ẽ',
    'Ẹ',
    'Ê',
    'Ế',
    'Ề',
    'Ể',
    'Ễ',
    'Ệ',
    'Í',
    'Ì',
    'Ỉ',
    'Ĩ',
    'Ị',
    'Ó',
    'Ò',
    'Ỏ',
    'Õ',
    'Ọ',
    'Ô',
    'Ố',
    'Ồ',
    'Ổ',
    'Ỗ',
    'Ộ',
    'Ơ',
    'Ớ',
    'Ờ',
    'Ở',
    'Ỡ',
    'Ợ',
    'Ú',
    'Ù',
    'Ủ',
    'Ũ',
    'Ụ',
    'Ư',
    'Ứ',
    'Ừ',
    'Ử',
    'Ữ',
    'Ự',
    'Ý',
    'Ỳ',
    'Ỷ',
    'Ỹ',
    'Ỵ',
  ];

  static const List<String> _normalChars = <String>[
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'd',
    'e',
    'e',
    'e',
    'e',
    'e',
    'e',
    'e',
    'e',
    'e',
    'e',
    'e',
    'i',
    'i',
    'i',
    'i',
    'i',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'o',
    'u',
    'u',
    'u',
    'u',
    'u',
    'u',
    'u',
    'u',
    'u',
    'u',
    'u',
    'y',
    'y',
    'y',
    'y',
    'y',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'A',
    'D',
    'E',
    'E',
    'E',
    'E',
    'E',
    'E',
    'E',
    'E',
    'E',
    'E',
    'E',
    'I',
    'I',
    'I',
    'I',
    'I',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'O',
    'U',
    'U',
    'U',
    'U',
    'U',
    'U',
    'U',
    'U',
    'U',
    'U',
    'U',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
  ];

  static String removeAccents(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text;
    // final List<String> chars = text.characters.toList();
    // for (int i = 0; i < chars.length; i++) {
    //   for (int j = 0; j < _accentChars.length; j++) {
    //     if (chars[i] == _accentChars[j]) {
    //       chars[i] = _normalChars[j];
    //       break;
    //     }
    //   }
    // }
    // return chars.join().replaceAll(RegExp(r'[^\w\s]+'), '');
  }
}
