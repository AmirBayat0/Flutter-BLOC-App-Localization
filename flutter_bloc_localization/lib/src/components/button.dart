import 'package:flutter/material.dart';
import 'package:flutter_bloc_localization/src/extesnions/button.dart';
import '../theme/app_theme.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton.filled({
    Key? key,
    required this.onPressed,
    required this.label,
    this.style = AppCustomButtonStyle.filled,
  }) : super(key: key);

  const AppCustomButton.outlined({
    Key? key,
    required this.onPressed,
    required this.label,
    this.style = AppCustomButtonStyle.outlined,
  }) : super(key: key);

  final Function() onPressed;
  final String label;
  final AppCustomButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: style.isFilled
              ? BorderSide.none
              : BorderSide(
                  color: Colors.grey[200]!,
                  width: 1.8,
                ),
        ),
        elevation: 0.0,
        highlightElevation: 0.0,
        color: style.isFilled ? AppColors.primary : null,
        splashColor:
            style.isFilled ? AppColors.primaryDarker : AppColors.lightGrey,
        child: Text(
          label,
          style: (style.isFilled
                  ? AppTheme.darkTextTheme.displaySmall
                  : AppTheme.lightTextTheme.displaySmall)
              ?.copyWith(fontSize: 18.0),
        ),
      ),
    );
  }
}

enum AppCustomButtonStyle { filled, outlined }
