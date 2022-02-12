part of 'google_translate_bloc.dart';

class GoogleTranslateState extends Equatable {
  final String inputText;
  final String resultText;
  final String from;
  final String to;

  const GoogleTranslateState({
    this.inputText = '',
    this.resultText = '',
    this.from = '',
    this.to = '',
  });

  @override
  List<Object> get props => [inputText, resultText, from, to];

  GoogleTranslateState copyWith({
    String? inputText,
    String? resultText,
    String? from,
    String? to,
  }) {
    return GoogleTranslateState(
      inputText: inputText ?? "",
      resultText: resultText ?? "",
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  factory GoogleTranslateState.fromJson(String str) =>
      GoogleTranslateState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GoogleTranslateState.fromMap(Map<String, dynamic> json) =>
      GoogleTranslateState(
        inputText: json["input_text"],
        resultText: json["result_text"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toMap() => {
        "input_text": inputText,
        "result_text": resultText,
        "from": from,
        "to": to,
      };
}
