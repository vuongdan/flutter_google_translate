import 'dart:convert';

import '../logic_bloc/blocs.dart';

class TranslateCard {
  TranslateCard({
    required this.createAt,
    required this.lastUpdate,
    required this.isPinned,
    required this.googleTranslateState,
  });

  final String createAt;
  final String lastUpdate;
  final bool isPinned;
  final GoogleTranslateState googleTranslateState;

  factory TranslateCard.fromJson(String str) =>
      TranslateCard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TranslateCard.fromMap(Map<String, dynamic> json) => TranslateCard(
        createAt: json["create_at"],
        lastUpdate: json["last_update"],
        isPinned: json["is_pinned"],
        googleTranslateState:
            GoogleTranslateState.fromMap(json["google_translate_state"]),
      );

  Map<String, dynamic> toMap() => {
        "create_at": createAt,
        "last_update": lastUpdate,
        "is_pinned": isPinned,
        "google_translate_state": googleTranslateState.toMap(),
      };
}
