part of 'google_translate_bloc.dart';

abstract class GoogleTranslateEvent extends Equatable {
  const GoogleTranslateEvent();

  @override
  List<Object> get props => [];
}

class GoogleTranslateInitData extends GoogleTranslateEvent {
  final GoogleTranslateState state;
  const GoogleTranslateInitData({
    required this.state,
  });
}

class GoogleTranslateTyping extends GoogleTranslateEvent {
  final String inputText;
  const GoogleTranslateTyping({
    required this.inputText,
  });
}

class GoogleTranslateChangeSourceLanguage extends GoogleTranslateEvent {
  final String from;
  const GoogleTranslateChangeSourceLanguage({
    required this.from,
  });
}

class GoogleTranslateChangeTargetLanguage extends GoogleTranslateEvent {
  final String? to;
  const GoogleTranslateChangeTargetLanguage({
    required this.to,
  });
}

class GoogleTranslateSwapLanguages extends GoogleTranslateEvent {}

class Translate extends GoogleTranslateEvent {}
