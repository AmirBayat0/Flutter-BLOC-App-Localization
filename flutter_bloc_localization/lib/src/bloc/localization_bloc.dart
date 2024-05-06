import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/language.dart';

part 'localization_event.dart';
part 'localization_state.dart';

const languagePrefsKey = 'languagePrefs';

class LocalizationBloc extends Bloc<LocalizationEvent, AppLocalizationState> {
  LocalizationBloc() : super(const AppLocalizationState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<GetLanguage>(onGetLanguage);
  }

  onChangeLanguage(
      ChangeLanguage event, Emitter<AppLocalizationState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      languagePrefsKey,
      event.selectedLanguage.value.languageCode,
    );
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  onGetLanguage(GetLanguage event, Emitter<AppLocalizationState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final selectedLanguage = prefs.getString(languagePrefsKey);
    emit(state.copyWith(
      selectedLanguage: selectedLanguage != null
          ? Language.values
              .where((item) => item.value.languageCode == selectedLanguage)
              .first
          : Language.english,
    ));
  }
}
