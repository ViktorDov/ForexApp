import 'dart:convert';

class StrategyDetails {
  final int id;
  final String strategyTitle;
  final String aboutTitle;
  final String aboutDefinition;
  final String aboutImage;
  final String caseTitle;
  final String caseImage;
  final String caseDefinition;
  final String exampleTitle;
  final String exampleDefinition;
  final String exampleImage;

  StrategyDetails({
    required this.id,
    required this.strategyTitle,
    required this.aboutTitle,
    required this.aboutDefinition,
    required this.aboutImage,
    required this.caseTitle,
    required this.caseImage,
    required this.caseDefinition,
    required this.exampleTitle,
    required this.exampleDefinition,
    required this.exampleImage,
  });

  StrategyDetails copyWith({
    int? id,
    String? strategyTitle,
    String? aboutTitle,
    String? aboutDefinition,
    String? aboutImage,
    String? caseTitle,
    String? caseImage,
    String? caseDefinition,
    String? exampleTitle,
    String? exampleDefinition,
    String? exampleImage,
  }) {
    return StrategyDetails(
      id: id ?? this.id,
      strategyTitle: strategyTitle ?? this.strategyTitle,
      aboutTitle: aboutTitle ?? this.aboutTitle,
      aboutDefinition: aboutDefinition ?? this.aboutDefinition,
      aboutImage: aboutImage ?? this.aboutImage,
      caseTitle: caseTitle ?? this.caseTitle,
      caseImage: caseImage ?? this.caseImage,
      caseDefinition: caseDefinition ?? this.caseDefinition,
      exampleTitle: exampleTitle ?? this.exampleTitle,
      exampleDefinition: exampleDefinition ?? this.exampleDefinition,
      exampleImage: exampleImage ?? this.exampleImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'strategy_title': strategyTitle,
      'about_title': aboutTitle,
      'about_definition': aboutDefinition,
      'about_image': aboutImage,
      'user_case_title': caseTitle,
      'user_case_image': caseImage,
      'user_case_definition': caseDefinition,
      'example_title': exampleTitle,
      'example_definition': exampleDefinition,
      'example_image': exampleImage,
    };
  }

  factory StrategyDetails.fromMap(Map<String, dynamic> map) {
    return StrategyDetails(
      id: map['id'] as int,
      strategyTitle: map['strategy_title'] as String,
      aboutTitle: map['about_title'] as String? ?? map['strategy_title'],
      aboutDefinition: map['about_definition'] as String,
      aboutImage: map['about_image'] as String? ?? '',
      caseTitle: map['user_case_title'] as String? ?? 'Кейсы',
      caseImage: map['user_case_image'] as String? ?? '',
      caseDefinition: map['user_case_definition'] as String,
      exampleTitle: map['example_title'] as String? ?? 'Примеры',
      exampleDefinition: map['example_definition'] as String,
      exampleImage: map['example_image'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StrategyDetails.fromJson(String source) =>
      StrategyDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StrategyDetails(id: $id, strategyTitle: $strategyTitle, aboutTitle: $aboutTitle, aboutDefinition: $aboutDefinition, aboutImage: $aboutImage, caseTitle: $caseTitle, caseDefinition: $caseDefinition, exampleTitle: $exampleTitle, exampleDefinition: $exampleDefinition)';
  }
}
