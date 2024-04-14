import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppMasks {
  AppMasks._();

  static final cepMask = MaskTextInputFormatter(mask: '#####-###');
}

extension MaskExtension on MaskTextInputFormatter {
  String unMaskText(String input) => unmaskText(input);
  int unMaskInt(String input) => int.parse(unmaskText(input));
  num unMaskDoublet(String input) => double.parse(unmaskText(input));
}
