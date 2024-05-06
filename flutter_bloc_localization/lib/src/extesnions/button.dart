import 'package:flutter_bloc_localization/src/components/button.dart';

extension ButtonStyleX on AppCustomButtonStyle {
  bool get isFilled => this == AppCustomButtonStyle.filled;
  bool get isOutlined => this == AppCustomButtonStyle.outlined;
}
