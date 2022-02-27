part of 'speech_to_text_bloc.dart';

abstract class SpeechToTextEvent extends Equatable {
  const SpeechToTextEvent();

  @override
  List<Object> get props => [];
}

class SpeechToTextInitData extends SpeechToTextEvent {
  final SpeechToTextState state;
  const SpeechToTextInitData({
    required this.state,
  });
}

class SpeechToTextInitDefaultData extends SpeechToTextEvent {}

class SpeechToTextReadyToRecordnize extends SpeechToTextEvent {}

class SpeechToTextChangeLocale extends SpeechToTextEvent {
  final String? newLocale;
  const SpeechToTextChangeLocale({
    required this.newLocale,
  });
}

class SpeechToTextStartRecognizing extends SpeechToTextEvent {}

class SpeechToTextWordByWord extends SpeechToTextEvent {
  final String currentText;
  const SpeechToTextWordByWord({
    required this.currentText,
  });
}

class SpeechToTextDoneRecognizing extends SpeechToTextEvent {}

class SpeechToTextStopRecognizing extends SpeechToTextEvent {}

class SpeechToTextCancelRecognizing extends SpeechToTextEvent {}

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
