// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({String? title, bool? isDone, bool? isDeleted}) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      // isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDone: map['isDone'] as bool,
      // isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  @override
  List<Object?> get props => [
        title,
        isDone,
        isDeleted,
      ];

  // String toJson() => json.encode(toMap());

  // factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
