class TodoModel {
  final int? id;
  final String title;
  final String date;
  final int isDone;

  TodoModel({
    this.id,
    required this.title,
    required this.date,
    required this.isDone,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'date': date, 'isDone': isDone};
  }
}
