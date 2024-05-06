part of 'localization_bloc.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends LocalizationEvent {
  const ChangeLanguage({required this.selectedLanguage});
  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];
}

class GetLanguage extends LocalizationEvent {}
