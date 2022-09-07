import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class GetTimeAfter {
  static String _defaultLocale = 'fr';

  static final Map<String, Messages> _messageMap = {
    'en': EnglishMessagesAfter(),
    'es': EspanaMessagesAfter(),
    'fr': FrenchMessagesAfter(),
  };

  ///
  /// Sets the default [locale]. By default it is `en`.
  ///
  /// Example:
  /// ```dart
  /// setDefaultLocale('fr');
  /// ```
  ///

  static void setDefaultLocale(String locale) {
    assert(_messageMap.containsKey(locale), '[locale] must be a valid locale');
    _defaultLocale = locale;
  }

  ///
  /// [parse] formats provided [dateTime] to a formatted time
  /// like 'a minute ago'.
  /// - If [locale] is passed will look for message for that locale.
  /// - If [pattern] is passed will be used as the DateFormat pattern.
  ///

  static String parse(DateTime dateTime, {String? locale, String? pattern}) {
    final localeUsed = locale ?? _defaultLocale;
    final message = _messageMap[localeUsed] ?? EnglishMessages();
    final patternUsed = pattern ?? "dd MMM, yyyy hh:mm aa";
    final date = DateFormat(patternUsed).format(dateTime);
    var elapsed = dateTime.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;

    var prefix = message.prefixAgo();
    var suffix = message.suffixAgo();

    ///
    /// Getting [seconds], [minutes], [hours], [days] from provided [dateTime]
    /// by subtracting it from current [DateTime.now()].
    ///

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;

    String msg;
    String result;
    if (seconds < 59) {
      msg = message.secsAgo(seconds.round());
      result = [prefix, msg, suffix].where((res) => res.isNotEmpty).join(message.wordSeparator());
    } else if (seconds < 119) {
      msg = message.minAgo(minutes.round());
      result = [prefix, msg, suffix].where((res) => res.isNotEmpty).join(message.wordSeparator());
    } else if (minutes < 59) {
      msg = message.minsAgo(minutes.round());
      result = [prefix, msg, suffix].where((res) => res.isNotEmpty).join(message.wordSeparator());
    } else if (minutes < 119) {
      msg = message.hourAgo(hours.round());
      result = [prefix, msg, suffix].where((res) => res.isNotEmpty).join(message.wordSeparator());
    } else if (hours < 24) {
      msg = message.hoursAgo(hours.round());
      result = [prefix, msg, suffix].where((res) => res.isNotEmpty).join(message.wordSeparator());
    } else if (hours < 48) {
      msg = message.dayAgo(hours.round());
      result = [prefix, msg, suffix].where((res) => res.isNotEmpty).join(message.wordSeparator());
    } else if (days < 8) {
      msg = message.daysAgo(days.round());
      result = [prefix, msg, suffix].where((res) => res.isNotEmpty).join(message.wordSeparator());
    } else {
      msg = date;
      result = date;
    }

    return result;
  }
}

class FrenchMessagesAfter implements Messages {
  @override
  String prefixAgo() => 'Dans ';

  String prefixFromNow() => "d'ici";

  @override
  String suffixAgo() => '';

  String suffixFromNow() => '';

  @override
  String secsAgo(int seconds) => '$seconds secondes';

  @override
  String minAgo(int minutes) => 'une minute';

  @override
  String minsAgo(int minutes) => '$minutes minutes';

  @override
  String hourAgo(int minutes) => 'une heure';

  @override
  String hoursAgo(int hours) => '$hours heures';

  @override
  String dayAgo(int hours) => 'un jour';

  @override
  String daysAgo(int days) => '$days jours';

  @override
  String wordSeparator() => ' ';
}

class EnglishMessagesAfter implements Messages {
  @override
  String prefixAgo() => 'in';

  String prefixFromNow() => '';

  @override
  String suffixAgo() => '';

  String suffixFromNow() => 'from now';

  @override
  String secsAgo(int seconds) => '$seconds seconds';

  @override
  String minAgo(int minutes) => 'a minute';

  @override
  String minsAgo(int minutes) => '$minutes minutes';

  @override
  String hourAgo(int minutes) => 'an hour';

  @override
  String hoursAgo(int hours) => '$hours hours';

  @override
  String dayAgo(int hours) => 'a day';

  @override
  String daysAgo(int days) => '$days days';

  @override
  String wordSeparator() => ' ';
}

class EspanaMessagesAfter implements Messages {
  @override
  String prefixAgo() => 'hace';

  String prefixFromNow() => 'dentro de';

  @override
  String suffixAgo() => '';

  String suffixFromNow() => '';

  @override
  String secsAgo(int seconds) => '$seconds segundos';

  @override
  String minAgo(int minutes) => 'un minuto';

  @override
  String minsAgo(int minutes) => '$minutes minutos';

  @override
  String hourAgo(int minutes) => 'una hora';

  @override
  String hoursAgo(int hours) => '$hours horas';

  @override
  String dayAgo(int hours) => 'un día';

  @override
  String daysAgo(int days) => '$days días';

  @override
  String wordSeparator() => ' ';
}

//Public Holiday
Future<List<DateTime>> fetchFrenchHolidays() async {
  final response = await http.get(
    Uri.parse(
      "https://calendrier.api.gouv.fr/jours-feries/metropole.json",
    ),
  );
  if (response.statusCode == 200) {
    return compute(parseFrenchHolidays, response.body);
  } else {
    throw Exception("Error");
  }
}

List<DateTime> parseFrenchHolidays(String resBody) {
  final Map<String, dynamic> map = json.decode(resBody) as Map<String, dynamic>;
  final List<DateTime> list = [];
  map.forEach((key, value) {
    final date = DateTime.parse(key);
    list.add(date);
  });
  return list;
}
