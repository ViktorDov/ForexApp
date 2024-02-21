// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tips {
  final int id;
  final String createdAt;
  final String imageUrl;
  final String title;
  final String description;
  final String article;
  final String contentType;
  Tips({
    required this.id,
    required this.createdAt,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.article,
    required this.contentType,
  });

  Tips copyWith({
    int? id,
    String? createdAt,
    String? imageUrl,
    String? title,
    String? description,
    String? article,
    String? contentType,
  }) {
    return Tips(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      article: article ?? this.article,
      contentType: contentType ?? this.contentType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'image_url': imageUrl,
      'title': title,
      'description': description,
      'article': article,
      'content_type': contentType,
    };
  }

  factory Tips.fromMap(Map<String, dynamic> map) {
    return Tips(
      id: map['id'] as int,
      createdAt: map['created_at'] as String,
      imageUrl: map['image_url'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      article: map['article'] as String,
      contentType: map['content_type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tips.fromJson(String source) =>
      Tips.fromMap(json.decode(source) as Map<String, dynamic>);
}
