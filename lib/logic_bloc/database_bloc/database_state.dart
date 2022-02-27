part of 'database_bloc.dart';

class DatabaseState extends Equatable {
  final List<TranslateCard> cards;
  final TextToSpeechState textToSpeechState;
  final SpeechToTextState speechToTextState;
  const DatabaseState({
    this.cards = const [],
    this.textToSpeechState = const TextToSpeechState(),
    this.speechToTextState = const SpeechToTextState(),
  });

  @override
  List<Object> get props => [cards, textToSpeechState, speechToTextState];

  DatabaseState copyWith({
    List<TranslateCard>? cards,
    TextToSpeechState? textToSpeechState,
    SpeechToTextState? speechToTextState,
  }) {
    return DatabaseState(
      cards: cards ?? this.cards,
      textToSpeechState: textToSpeechState ?? this.textToSpeechState,
      speechToTextState: speechToTextState ?? this.speechToTextState,
    );
  }
}
