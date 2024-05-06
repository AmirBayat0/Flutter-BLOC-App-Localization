import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_localization/l10n/l10n.dart';
import 'package:flutter_bloc_localization/src/bloc/localization_bloc.dart';
import 'package:flutter_bloc_localization/src/models/language.dart';
import 'package:flutter_bloc_localization/src/theme/app_theme.dart';

final class AppUtils {
  AppUtils._();
  static void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.chooseLanguage,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<LocalizationBloc, AppLocalizationState>(
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: Language.values.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          context.read<LocalizationBloc>().add(ChangeLanguage(
                              selectedLanguage: Language.values[index]));
                          Future.delayed(const Duration(milliseconds: 300))
                              .then((value) => Navigator.of(context).pop());
                        },
                        leading: ClipOval(
                          child: Language.values[index].image.image(
                            height: 32.0,
                            width: 32.0,
                          ),
                        ),
                        title: Text(Language.values[index].text),
                        trailing:
                            Language.values[index] == state.selectedLanguage
                                ? Icon(
                                    Icons.check_circle_rounded,
                                    color: AppColors.primary,
                                  )
                                : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: Language.values[index] == state.selectedLanguage
                              ? BorderSide(color: AppColors.primary, width: 1.5)
                              : BorderSide(color: Colors.grey[300]!),
                        ),
                        tileColor:
                            Language.values[index] == state.selectedLanguage
                                ? AppColors.primary.withOpacity(0.05)
                                : null,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16.0);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
