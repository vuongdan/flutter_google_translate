class TextToSpeechConstants {
  static const List<String> languages = [
    "fr-CA",
    "en-AU",
    "pt-BR",
    "ru-RU",
    "da-DK",
    "de-DE",
    "pl-PL",
    "ro-RO",
    "nl-NL",
    "nl-BE",
    "en-IN",
    "th-TH",
    "tr-TR",
    "en-GB",
    "id-ID",
    "hi-IN",
    "no-NO",
    "ko-KR",
    "en-ZA",
    "sk-SK",
    "en-US",
    "es-ES",
    "ja-JP",
    "he-IL",
    "el-GR",
    "en-IE",
    "zh-HK",
    "hu-HU",
    "zh-CN",
    "sv-SE",
    "fr-FR",
    "it-IT",
    "cs-CZ",
    "zh-TW",
    "ar-SA",
    "es-MX",
    "fi-FI",
    "pt-PT",
  ];

  static const List<String> voices = [
    "{name: Maged, locale: ar-SA}",
    "{name: Zuzana, locale: cs-CZ}",
    "{name: Sara, locale: da-DK}",
    "{name: Anna, locale: de-DE}",
    "{name: Helena, locale: de-DE}",
    "{name: Martin, locale: de-DE}",
    "{name: Melina, locale: el-GR}",
    "{name: Catherine, locale: en-AU}",
    "{name: Gordon, locale: en-AU}",
    "{name: Karen, locale: en-AU}",
    "{name: Arthur, locale: en-GB}",
    "{name: Daniel, locale: en-GB}",
    "{name: Martha, locale: en-GB}",
    "{name: Moira, locale: en-IE}",
    "{name: Rishi, locale: en-IN}",
    "{name: Aaron, locale: en-US}",
    "{name: Fred, locale: en-US}",
    "{name: Nicky, locale: en-US}",
    "{name: Samantha, locale: en-US}",
    "{name: Tessa, locale: en-ZA}",
    "{name: Mónica, locale: es-ES}",
    "{name: Damayanti, locale: id-ID}",
    "{name: Alice, locale: it-IT}",
    "{name: Hattori, locale: ja-JP}",
    "{name: Kyoko, locale: ja-JP}",
    "{name: O-ren, locale: ja-JP}",
    "{name: Yuna, locale: ko-KR}",
    "{name: Ellen, locale: nl-BE}",
    "{name: Xander, locale: nl-NL}",
    "{name: Nora, locale: no-NO}",
    "{name: Zosia, locale: pl-PL}",
    "{name: Luciana, locale: pt-BR}",
    "{name: Joana, locale: pt-PT}",
    "{name: Ioana, locale: ro-RO}",
    "{name: Milena, locale: ru-RU}",
    "{name: Laura, locale: sk-SK}",
    "{name: Alva, locale: sv-SE}",
    "{name: Kanya, locale: th-TH}",
    "{name: Yelda, locale: tr-TR}",
    "{name: Li-mu, locale: zh-CN}",
    "{name: Ting-Ting, locale: zh-CN}",
    "{name: Yu-shu, locale: zh-CN}",
    "{name: Sin-Ji, locale: zh-HK}",
    "{name: Mei-Jia, locale: zh-TW}",
    "{name: Alex, locale: en-US}",
  ];

  static Voice mapStringToVoiceObject(String voiceString) {
    const Map<String, Voice> map = {
      "{name: Maged, locale: ar-SA}": Voice(name: "Maged", locale: "ar-SA"),
      "{name: Zuzana, locale: cs-CZ}": Voice(name: "Zuzana", locale: "cs-CZ"),
      "{name: Sara, locale: da-DK}": Voice(name: "Sara", locale: "da-DK"),
      "{name: Anna, locale: de-DE}": Voice(name: "Anna", locale: "de-DE"),
      "{name: Helena, locale: de-DE}": Voice(name: "Helena", locale: "de-DE"),
      "{name: Martin, locale: de-DE}": Voice(name: "Martin", locale: "de-DE"),
      "{name: Melina, locale: el-GR}": Voice(name: "Melina", locale: "el-GR"),
      "{name: Catherine, locale: en-AU}":
          Voice(name: "Catherine", locale: "en-AU"),
      "{name: Gordon, locale: en-AU}": Voice(name: "Gordon", locale: "en-AU"),
      "{name: Karen, locale: en-AU}": Voice(name: "Karen", locale: "en-AU"),
      "{name: Arthur, locale: en-GB}": Voice(name: "Arthur", locale: "en-GB"),
      "{name: Daniel, locale: en-GB}": Voice(name: "Daniel", locale: "en-GB"),
      "{name: Martha, locale: en-GB}": Voice(name: "Martha", locale: "en-GB"),
      "{name: Moira, locale: en-IE}": Voice(name: "Moira", locale: "en-IE"),
      "{name: Rishi, locale: en-IN}": Voice(name: "Rishi", locale: "en-IN"),
      "{name: Aaron, locale: en-US}": Voice(name: "Aaron", locale: "en-US"),
      "{name: Fred, locale: en-US}": Voice(name: "Fred", locale: "en-US"),
      "{name: Nicky, locale: en-US}": Voice(name: "Nicky", locale: "en-US"),
      "{name: Samantha, locale: en-US}":
          Voice(name: "Samantha", locale: "en-US"),
      "{name: Tessa, locale: en-ZA}": Voice(name: "Tessa", locale: "en-ZA"),
      "{name: Mónica, locale: es-ES}": Voice(name: "Mónica", locale: "es-ES"),
      "{name: Paulina, locale: es-MX}": Voice(name: "Paulina", locale: "es-MX"),
      "{name: Satu, locale: fi-FI}": Voice(name: "Satu", locale: "fi-FI"),
      "{name: Amélie, locale: fr-CA}": Voice(name: "Amélie", locale: "fr-CA"),
      "{name: Daniel, locale: fr-FR}": Voice(name: "Daniel", locale: "fr-FR"),
      "{name: Marie, locale: fr-FR}": Voice(name: "Marie", locale: "fr-FR"),
      "{name: Thomas, locale: fr-FR}": Voice(name: "Thomas", locale: "fr-FR"),
      "{name: Carmit, locale: he-IL}": Voice(name: "Carmit", locale: "he-IL"),
      "{name: Lekha, locale: hi-IN}": Voice(name: "Lekha", locale: "hi-IN"),
      "{name: Mariska, locale: hu-HU}":
          Voice(name: "Mariska", locale: " hu-HU"),
      "{name: Damayanti, locale: id-ID}":
          Voice(name: "Damayanti", locale: "id-ID"),
      "{name: Alice, locale: it-IT}": Voice(name: "Alice", locale: "it-IT"),
      "{name: Hattori, locale: ja-JP}": Voice(name: "Hattori", locale: "ja-JP"),
      "{name: Kyoko, locale: ja-JP}": Voice(name: "Kyoko", locale: "ja-JP"),
      "{name: O-ren, locale: ja-JP}": Voice(name: "O-ren", locale: "ja-JP"),
      "{name: Yuna, locale: ko-KR}": Voice(name: "Yuna", locale: "ko-KR"),
      "{name: Ellen, locale: nl-BE}": Voice(name: "Ellen", locale: "nl-BE"),
      "{name: Xander, locale: nl-NL}": Voice(name: "Xander", locale: "nl-NL"),
      "{name: Nora, locale: no-NO}": Voice(name: "Nora", locale: "no-NO"),
      "{name: Zosia, locale: pl-PL}": Voice(name: "Zosia", locale: "pl-PL"),
      "{name: Luciana, locale: pt-BR}": Voice(name: "Luciana", locale: "pt-BR"),
      "{name: Joana, locale: pt-PT}": Voice(name: "Joana", locale: "pt-PT"),
      "{name: Ioana, locale: ro-RO}": Voice(name: "Ioana", locale: "ro-RO"),
      "{name: Milena, locale: ru-RU}": Voice(name: "Milena", locale: "ru-RU"),
      "{name: Laura, locale: sk-SK}": Voice(name: "Laura", locale: "sk-SK"),
      "{name: Alva, locale: sv-SE}": Voice(name: "Alva", locale: "sv-SE"),
      "{name: Kanya, locale: th-TH}": Voice(name: "Kanya", locale: "th-TH"),
      "{name: Yelda, locale: tr-TR}": Voice(name: "Yelda", locale: "tr-TR"),
      "{name: Li-mu, locale: zh-CN}": Voice(name: "Li-mu", locale: "zh-CN"),
      "{name: Ting-Ting, locale: zh-CN}":
          Voice(name: "Ting-Ting", locale: "zh-CN"),
      "{name: Yu-shu, locale: zh-CN}": Voice(name: "Yu-shu", locale: "zh-CN"),
      "{name: Sin-Ji, locale: zh-HK}": Voice(name: "Sin-Ji", locale: "zh-HK"),
      "{name: Mei-Jia, locale: zh-TW}": Voice(name: "Mei-Jia", locale: "zh-TW"),
      "{name: Alex, locale: en-US}": Voice(name: "Alex", locale: "en-US"),
    };
    return map[voiceString] ?? const Voice(name: "Unknown", locale: "en-US");
    //TextToSpeechConstants.mapStringToVoiceObject(voice).locale.substring(3,5).toLowerCase() to get flagcode
    //TextToSpeechConstants.mapStringToVoiceObject(voice).locale.substring(0,2).toLowerCase() to get LanguageName
  }
}

class Voice {
  final String name;
  final String locale;
  const Voice({
    required this.name,
    required this.locale,
  });
}
