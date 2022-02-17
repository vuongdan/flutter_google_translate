part of 'text_to_speech_bloc.dart';

abstract class TextToSpeechEvent extends Equatable {
  const TextToSpeechEvent();

  @override
  List<Object> get props => [];
}

class TextToSpeechInitData extends TextToSpeechEvent {}

class TextToSpeechPlay extends TextToSpeechEvent {
  final String text;
  final Voice voice;
  const TextToSpeechPlay({
    required this.text,
    required this.voice,
  });
}

class TextToSpeechStop extends TextToSpeechEvent {}

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
  final Voice? newVoice;
  const TextToSpeechChangeVoice({
    this.newVoice,
  });
}

class TextToSpeechTyping1 extends TextToSpeechEvent {
  final String? textToSpeechText;
  const TextToSpeechTyping1({
    required this.textToSpeechText,
  });
}

class TextToSpeechTyping2 extends TextToSpeechEvent {
  final String? textToSpeechText;
  const TextToSpeechTyping2({
    required this.textToSpeechText,
  });
}
