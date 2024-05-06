part of 'localization_bloc.dart';

class AppLocalizationState extends Equatable {
  const AppLocalizationState({
    Language? selectedLanguage,
  }) : selectedLanguage = selectedLanguage ?? Language.english;

  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];

  AppLocalizationState copyWith({Language? selectedLanguage}) {
    return AppLocalizationState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
