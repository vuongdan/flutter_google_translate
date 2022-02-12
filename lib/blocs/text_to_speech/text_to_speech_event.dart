part of 'text_to_speech_bloc.dart';

abstract class TextToSpeechEvent extends Equatable {
  const TextToSpeechEvent();

  @override
  List<Object> get props => [];
}

class TextToSpeechInit extends TextToSpeechEvent {
  final TextToSpeechState textToSpeechState;
  const TextToSpeechInit({
    required this.textToSpeechState,
  });
}

class TextToSpeechReplaceData extends TextToSpeechEvent {
  final TextToSpeechState textToSpeechState;
  const TextToSpeechReplaceData({
    required this.textToSpeechState,
  });
}

class TextToSpeechChangePitch extends TextToSpeechEvent {
  final double newPitch;
  const TextToSpeechChangePitch({
    required this.newPitch,
  });
}

class TextToSpeechChangeVolume extends TextToSpeechEvent {
  final double newVolume;
  const TextToSpeechChangeVolume({
    required this.newVolume,
  });
}

class TextToSpeechChangeRate extends TextToSpeechEvent {
  final double newRate;
  const TextToSpeechChangeRate({
    required this.newRate,
  });
}

class TextToSpeechChangeVoice extends TextToSpeechEvent {
  final String? newVoice;
  const TextToSpeechChangeVoice({
    this.newVoice,
  });
}

class TextToSpeechTyping extends TextToSpeechEvent {
  final String? textToSpeechText;
  const TextToSpeechTyping({
    required this.textToSpeechText,
  });
}

class TextToSpeechPlay extends TextToSpeechEvent {
  final String textToSpeechText;
  const TextToSpeechPlay({
    required this.textToSpeechText,
  });
}

class TextToSpeechStop extends TextToSpeechEvent {}

class TextToSpeechPause extends TextToSpeechEvent {}

class TextToSpeechContinues extends TextToSpeechEvent {}
