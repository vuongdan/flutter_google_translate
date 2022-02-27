part of 'text_to_speech_bloc.dart';

enum TextToSpeechStatus { playing1, playing2, stoped, paused, continued }

class Voice {
  final String name;
  final String locale;
  const Voice({
    required this.name,
    required this.locale,
  });
  factory Voice.fromJson(String str) => Voice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Voice.fromMap(Map<String, dynamic> json) => Voice(
        name: json["name"],
        locale: json["locale"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "locale": locale,
      };
}

class TextToSpeechState extends Equatable {
  const TextToSpeechState({
    this.voices = const [],
    this.voice = const Voice(name: "", locale: ""),
    this.voice2 = const Voice(name: "", locale: ""),
    this.languages = const [],
    this.language = "",
    this.status = TextToSpeechStatus.stoped,
    this.volume = 0.8,
    this.pitch = 1.0,
    this.rate = 0.5,
  });
  final List<Voice> voices;
  final Voice voice;
  final Voice voice2;
  final List<Object?> languages;
  final String language;
  final TextToSpeechStatus status;
  final double volume;
  final double pitch;
  final double rate;

  static const empty = TextToSpeechState();
  @override
  List<Object> get props =>
      [voices, voice, voice2, languages, language, volume, pitch, rate, status];

  TextToSpeechState copyWith({
    List<Voice>? voices,
    Voice? voice,
    Voice? voice2,
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
      voice2: voice2 ?? this.voice2,
      languages: languages ?? this.languages,
      language: language ?? this.language,
      status: status ?? this.status,
      volume: volume ?? this.volume,
      pitch: pitch ?? this.pitch,
      rate: rate ?? this.rate,
    );
  }

  factory TextToSpeechState.fromJson(String str) =>
      TextToSpeechState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TextToSpeechState.fromMap(Map<String, dynamic> json) =>
      TextToSpeechState(
        voice: Voice.fromMap(json["voice"]),
        volume: json["volume"].toDouble(),
        pitch: json["pitch"].toDouble(json),
        rate: json["rate"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "voice": voice.toMap(),
        "volume": volume,
        "pitch": pitch,
        "rate": rate,
      };
}
