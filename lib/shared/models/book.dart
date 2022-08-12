// ignore_for_file:implicit_dynamic_map_literal
// ignore_for_file: argument_type_not_assignable

import 'dart:convert';

class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final DateTime publishDate;
  final String description;
  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.publishDate,
    required this.description,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? imageUrl,
    DateTime? publishDate,
    String? description,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      publishDate: publishDate ?? this.publishDate,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'publishDate': publishDate.millisecondsSinceEpoch,
      'description': description,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      publishDate: DateTime.fromMillisecondsSinceEpoch(map['publishDate']),
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, imageUrl: $imageUrl, publishDate: $publishDate, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.id == id &&
        other.title == title &&
        other.author == author &&
        other.imageUrl == imageUrl &&
        other.publishDate == publishDate &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        author.hashCode ^
        imageUrl.hashCode ^
        publishDate.hashCode ^
        description.hashCode;
  }
}
