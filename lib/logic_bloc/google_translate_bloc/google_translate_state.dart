part of 'google_translate_bloc.dart';

class GoogleTranslateState extends Equatable {
  const GoogleTranslateState({
    this.inputText = "",
    this.resultText = "",
    this.sourceLanguage = "",
    this.targetLanguage = "",
  });
  final String inputText;
  final String resultText;
  final String sourceLanguage;
  final String targetLanguage;

  @override
  List<Object> get props =>
      [inputText, resultText, sourceLanguage, targetLanguage];

  GoogleTranslateState copyWith({
    String? inputText,
    String? resultText,
    String? sourceLanguage,
    String? targetLanguage,
  }) {
    return GoogleTranslateState(
      inputText: inputText ?? this.inputText,
      resultText: resultText ?? this.resultText,
      sourceLanguage: sourceLanguage ?? this.sourceLanguage,
      targetLanguage: targetLanguage ?? this.targetLanguage,
    );
  }

  factory GoogleTranslateState.fromJson(String str) =>
      GoogleTranslateState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GoogleTranslateState.fromMap(Map<String, dynamic> json) =>
      GoogleTranslateState(
        inputText: json["input_text"],
        resultText: json["result_text"],
        sourceLanguage: json["source_language"],
        targetLanguage: json["target_language"],
      );

  Map<String, dynamic> toMap() => {
        "input_text": inputText,
        "result_text": resultText,
        "source_language": sourceLanguage,
        "target_language": targetLanguage,
      };
}
