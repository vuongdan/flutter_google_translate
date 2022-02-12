part of 'text_to_speech_bloc.dart';

enum TextToSpeechStatus { stoped, playing, paused, continued }

class TextToSpeechState extends Equatable {
  final String voice;
  final List<String> voiceList;
  final String textToSpeechText;
  final double pitch;
  final double volume;
  final double rate; // speed
  final TextToSpeechStatus status;
  const TextToSpeechState({
    this.voice = '',
    this.voiceList = TextToSpeechConstants.textToSpeechVoiceName,
    this.textToSpeechText = '',
    this.pitch = 0.0,
    this.volume = 0.0,
    this.rate = 0.0,
    this.status = TextToSpeechStatus.stoped,
  });

  @override
  List<Object> get props =>
      [voice, textToSpeechText, pitch, volume, rate, status];

  TextToSpeechState copyWith({
    String? voice,
    List<String>? voiceList,
    String? textToSpeechText,
    double? pitch,
    double? volume,
    double? rate,
    TextToSpeechStatus? status,
  }) {
    return TextToSpeechState(
      voice: voice ?? this.voice,
      voiceList: voiceList ?? this.voiceList,
      textToSpeechText: textToSpeechText ?? this.textToSpeechText,
      pitch: pitch ?? this.pitch,
      volume: volume ?? this.volume,
      rate: rate ?? this.rate,
      status: status ?? this.status,
    );
  }

  factory TextToSpeechState.fromJson(String str) =>
      TextToSpeechState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TextToSpeechState.fromMap(Map<String, dynamic> json) =>
      TextToSpeechState(
        voice: json["voice"],
        textToSpeechText: json["text_to_speech_text"],
        pitch: json["pitch"],
        volume: json["volume"].toDouble(),
        rate: json["rate"],
      );

  Map<String, dynamic> toMap() => {
        "voice": voice,
        "text_to_speech_text": textToSpeechText,
        "pitch": pitch,
        "volume": volume,
        "rate": rate,
      };
}
