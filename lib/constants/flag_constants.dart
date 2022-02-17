class FlagConstants {
  static String mapLanguageCodeToFlag({required String languageCode}) {
    Map<String, String> map = {
      // 'auto': '',
      'af': 'na',
      'sq': 'mk',
      'am': 'et',
      'ar': 'dz',
      'hy': 'am',
      'az': 'az',
      // 'eu': '', multi national
      'be': 'by',
      'bn': 'bd',
      'bs': 'ba',
      'bg': 'bg',
      // 'ca': '', multi national
      'ceb': 'ph',
      // 'ny': '',
      'zh-cn': 'cn',
      'zh-tw': 'cn',
      // 'co': '', multi national
      // 'hr': '', multi national
      // 'cs': '', multi national
      // 'da': '', multi national
      // 'nl': '', multi national
      'en': 'us',
      // 'eo': '', unknow
      'et': 'ee',
      'tl': 'ph',
      'fi': 'sf',
      'fr': 'fr',
      // 'fy': '',
      'gl': 'es',
      // 'ka': '', multi national
      // 'de': '', multi national
      // 'el': '', multi national
      // 'gu': '', unknown
      'ht': 'ht',
      // 'ha': '', multi national
      // 'haw': '', unknown
      'iw': 'il',
      'hi': 'in',
      'hmn': 'vn',
      'hu': 'hu',
      'is': 'is',
      'ig': 'ng',
      'id': 'id',
      'ga': 'ie',
      'it': 'it',
      'ja': 'jp',
      'jw': 'id',
      // 'kn': '', unknown
      'kk': 'kz',
      'km': 'kh',
      'ko': 'kr',
      // 'ku': '', multi national
      'ky': 'kg',
      'lo': 'la',
      // 'la' : '', unknow
      'lv': 'lv',
      'lt': 'lt',
      'lb': 'lu',
      'mk': 'mk',
      'mg': 'mg',
      'ms': 'my',
      // 'ml': '', unknown
      'mt': 'mt',
      'mi': 'ck',
      // 'mr': '',
      'mn': 'mn',
      'my': 'mm',
      'ne': 'np',
      'no': 'no',
      'ps': 'af',
      'fa': 'ir',
      'pl': 'fi',
      'pt': 'ao',
      'pa': 'pk',
      'ro': 'ro',
      'ru': 'ru',
      // 'sm': '',
      // 'gd': '',
      // 'sr': '',
      // 'st': '',
      'sn': 'zw',
      'sd': 'pk',
      'si': 'lk',
      'sk': 'sk',
      'sl': 'si',
      'so': 'so',
      'es': 'es',
      'su': 'sd',
      // 'sw': '',
      'sv': 'se',
      'tg': 'tj',
      // 'ta': '',
      // 'te': '',
      'th': 'th',
      'tr': 'tr',
      'uk': 'uk',
      // 'ur': '',
      'uz': 'uz',
      // 'ug': '',
      'vi': 'vn',
      // 'cy': '',
      // 'xh': '',
      // 'yi': '',
      'yo': 'ng',
      'zu': 'za',
    };
    return map[languageCode] ?? 'unknown';
  }
}
