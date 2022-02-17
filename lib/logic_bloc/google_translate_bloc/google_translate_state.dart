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
}
