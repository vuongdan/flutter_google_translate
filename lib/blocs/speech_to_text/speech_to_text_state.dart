part of 'speech_to_text_bloc.dart';

enum SpeechToTextStatus { playing, ready, unknown }

class SpeechToTextState extends Equatable {
  final int listenDuration;
  final int pauseDuration;
  final SpeechToTextStatus status;
  final bool isListening;
  final String recognizedWords;
  final String currentLocaleId;
  final List<String> localeIds;

  const SpeechToTextState({
    this.listenDuration = 0,
    this.pauseDuration = 0,
    this.isListening = false,
    this.status = SpeechToTextStatus.unknown,
    this.recognizedWords = '',
    this.currentLocaleId = '',
    this.localeIds = SpeechToTextConstants.localeIds,
  });

  @override
  List<Object> get props => [
        listenDuration,
        pauseDuration,
        isListening,
        status,
        recognizedWords,
        currentLocaleId,
        localeIds,
      ];

  SpeechToTextState copyWith({
    int? listenDuration,
    int? pauseDuration,
    SpeechToTextStatus? status,
    bool? isListening,
    String? recognizedWords,
    String? currentLocaleId,
    List<String>? localeIds,
  }) {
    return SpeechToTextState(
      listenDuration: listenDuration ?? this.listenDuration,
      pauseDuration: pauseDuration ?? this.pauseDuration,
      status: status ?? this.status,
      isListening: isListening ?? this.isListening,
      recognizedWords: recognizedWords ?? this.recognizedWords,
      currentLocaleId: currentLocaleId ?? this.currentLocaleId,
      localeIds: localeIds ?? this.localeIds,
    );
  }

  factory SpeechToTextState.fromJson(String str) =>
      SpeechToTextState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpeechToTextState.fromMap(Map<String, dynamic> json) =>
      SpeechToTextState(
        listenDuration: json["listen_duration"],
        pauseDuration: json["pause_duration"],
        recognizedWords: json["recognized_words"],
        currentLocaleId: json["current_locale_id"],
      );

  Map<String, dynamic> toMap() => {
        "listen_duration": listenDuration,
        "pause_duration": pauseDuration,
        "recognized_words": recognizedWords,
        "current_locale_id": currentLocaleId,
      };
}
