part of 'speech_to_text_bloc.dart';

abstract class SpeechToTextEvent extends Equatable {
  const SpeechToTextEvent();

  @override
  List<Object> get props => [];
}

class SpeechToTextInit extends SpeechToTextEvent {
  final SpeechToTextState speechToTextState;
  const SpeechToTextInit({
    required this.speechToTextState,
  });
}

class SpeechToTextReplaceData extends SpeechToTextEvent {
  final SpeechToTextState speechToTextState;
  const SpeechToTextReplaceData({
    required this.speechToTextState,
  });
}

class SpeechToTextChangeListenDuration extends SpeechToTextEvent {
  final int newListenDuration;
  const SpeechToTextChangeListenDuration({
    required this.newListenDuration,
  });
}

class SpeechToTextChangePauseDuration extends SpeechToTextEvent {
  final int newPauseDuration;
  const SpeechToTextChangePauseDuration({
    required this.newPauseDuration,
  });
}

class SpeechToTextChangeLocale extends SpeechToTextEvent {
  final String? newLocale;
  const SpeechToTextChangeLocale({
    required this.newLocale,
  });
}

class SpeechToTextStartListening extends SpeechToTextEvent {}

class SpeechToTextWordByWordListening extends SpeechToTextEvent {
  final String currentText;
  const SpeechToTextWordByWordListening({
    required this.currentText,
  });
}

class SpeechToTextListenDone extends SpeechToTextEvent {}

class SpeechToTextStopListening extends SpeechToTextEvent {}

class SpeechToTextCancelListening extends SpeechToTextEvent {}
