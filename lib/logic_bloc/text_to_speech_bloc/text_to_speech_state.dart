part of 'text_to_speech_bloc.dart';

enum TextToSpeechStatus { playing, stoped, paused, continued }

class TextToSpeechState extends Equatable {
  const TextToSpeechState({
    this.voices = const [],
    this.voice = const Voice(name: "", locale: ""),
    this.languages = const [],
    this.language = "",
    this.status = TextToSpeechStatus.stoped,
    this.volume = 0.8,
    this.pitch = 1.0,
    this.rate = 0.5,
  });
  final List<Voice> voices;
  final Voice voice;
  final List<Object?> languages;
  final String language;

  final TextToSpeechStatus status;
  final double volume;
  final double pitch;
  final double rate;
  @override
  List<Object> get props =>
      [voices, voice, languages, language, volume, pitch, rate];

  TextToSpeechState copyWith({
    List<Voice>? voices,
    Voice? voice,
    List<Object?>? languages,
    String? language,
    TextToSpeechStatus? status,
    double? volume,
    double? pitch,
    double? rate,
  }) {
    return TextToSpeechState(
      voices: voices ?? this.voices,
      voice: voice ?? this.voice,
      languages: languages ?? this.languages,
      language: language ?? this.language,
      status: status ?? this.status,
      volume: volume ?? this.volume,
      pitch: pitch ?? this.pitch,
      rate: rate ?? this.rate,
    );
  }
}
