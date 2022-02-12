part of 'google_translate_bloc.dart';

abstract class GoogleTranslateEvent extends Equatable {
  const GoogleTranslateEvent();

  @override
  List<Object> get props => [];
}

class GoogleTranslateInit extends GoogleTranslateEvent {
  final GoogleTranslateState googleTranslateState;
  const GoogleTranslateInit({
    required this.googleTranslateState,
  });
}

class GoogleTranslateTyping extends GoogleTranslateEvent {
  final String? inputText;
  const GoogleTranslateTyping({
    this.inputText,
  });
}

class GoogleTranslateTranslating extends GoogleTranslateEvent {
  final String? inputText;
  final String from;
  final String to;
  const GoogleTranslateTranslating({
    required this.inputText,
    required this.from,
    required this.to,
  });
}

class GoogleTranslateChangeSourceLanguage extends GoogleTranslateEvent {
  final String? from;
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

class GoogleTranslateSwapLanguages extends GoogleTranslateEvent {
  final String currentFrom;
  final String currentTo;
  const GoogleTranslateSwapLanguages({
    required this.currentFrom,
    required this.currentTo,
  });
}

class GoogleTranslateRePlaceData extends GoogleTranslateEvent {
  final GoogleTranslateState googleTranslateState;
  const GoogleTranslateRePlaceData({
    required this.googleTranslateState,
  });
}
