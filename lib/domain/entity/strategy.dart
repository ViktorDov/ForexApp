import 'dart:convert';

class Strategy {
  final int id;
  final String title;
  final String owner;
  final String time;
  final bool favorite;
  final List<String> currencyPair;
  final List<String> timeOfString;

  const Strategy({
    required this.id,
    required this.title,
    required this.owner,
    required this.time,
    required this.favorite,
    required this.currencyPair,
    required this.timeOfString,
  });

  Strategy copyWith({
    int? id,
    String? title,
    String? owner,
    String? time,
    bool? favorite,
    List<String>? currencyPair,
    List<String>? timeOfString,
  }) {
    return Strategy(
      id: id ?? this.id,
      title: title ?? this.title,
      owner: owner ?? this.owner,
      time: time ?? this.time,
      favorite: favorite ?? this.favorite,
      currencyPair: currencyPair ?? this.currencyPair,
      timeOfString: timeOfString ?? this.timeOfString,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'owner': owner,
      'time': time,
      'favorite': favorite,
      'currencyPair': currencyPair,
      'timeOfString': timeOfString,
    };
  }

  factory Strategy.fromMap(Map<String, dynamic> map) {
    return Strategy(
      id: map['id'] as int,
      title: map['strategy_title'] as String,
      owner: map['owner'] as String,
      time: map['created_at'] as String,
      favorite: map['favorite'] as bool, 
      currencyPair: List<String>.from((map['currency_pair'] as List<dynamic>))
          .cast<String>(),
      timeOfString: List<String>.from((map['time_of_string'] as List<dynamic>))
          .cast<String>(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Strategy.fromJson(String source) =>
      Strategy.fromMap(json.decode(source) as Map<String, dynamic>);
}
