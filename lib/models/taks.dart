// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task(
      {required this.title,
      required this.description,
      required this.id,
      required this.date,
      this.isDone,
      this.isDeleted,
      this.isFavorite}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith(
      {String? title,
      String? description,
      String? id,
      String? date,
      bool? isDone,
      bool? isDeleted,
      bool? isFavorite}) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      description: description ?? this.description,
      date: date ?? this.date,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        id: map['id'] ?? '',
        date: map['date'],
        isDone: map['isDone'] ?? '',
        isDeleted: map['isDeleted'],
        isFavorite: map['isFavorite']);
  }

  @override
  List<Object?> get props =>
      [title, description, id, date, isDone, isDeleted, isFavorite];
}
