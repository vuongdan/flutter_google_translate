part of 'speech_to_text_bloc.dart';

enum SpeechToTextStatus { recognizing, ready, unknown }

class SpeechToTextState extends Equatable {
  const SpeechToTextState({
    this.listenDuration = 15,
    this.pauseDuration = 3,
    this.recognizedWords = "",
    this.currentLocaleId = "",
    this.localeNames = const [],
    this.status = SpeechToTextStatus.unknown,
  });
  final int listenDuration;
  final int pauseDuration;
  final String recognizedWords;
  final String currentLocaleId;
  final List<LocaleName> localeNames;
  final SpeechToTextStatus status;

  @override
  List<Object> get props => [
        listenDuration,
        pauseDuration,
        recognizedWords,
        currentLocaleId,
        localeNames,
        status
      ];

  SpeechToTextState copyWith({
    int? listenDuration,
    int? pauseDuration,
    String? recognizedWords,
    String? currentLocaleId,
    List<LocaleName>? localeNames,
    SpeechToTextStatus? status,
  }) {
    return SpeechToTextState(
      listenDuration: listenDuration ?? this.listenDuration,
      pauseDuration: pauseDuration ?? this.pauseDuration,
      recognizedWords: recognizedWords ?? this.recognizedWords,
      currentLocaleId: currentLocaleId ?? this.currentLocaleId,
      localeNames: localeNames ?? this.localeNames,
      status: status ?? this.status,
    );
  }

  factory SpeechToTextState.fromJson(String str) =>
      SpeechToTextState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpeechToTextState.fromMap(Map<String, dynamic> json) =>
      SpeechToTextState(
        listenDuration: json["listen_duration"],
        pauseDuration: json["pause_duration"],
        currentLocaleId: json["current_locale_id"],
      );

  Map<String, dynamic> toMap() => {
        "listen_duration": listenDuration,
        "pause_duration": pauseDuration,
        "current_locale_id": currentLocaleId,
      };
}
