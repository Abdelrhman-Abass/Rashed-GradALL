import 'package:equatable/equatable.dart';

class Message extends Equatable {
  Message({
    this.id,
    this.content,
    this.fileName,
    this.isFromBot = false,
    this.type,
    this.createdAt,});

  Message.fromJson(dynamic json) {
    id = json['id'];
    content = json['content'];
    fileName = json['fileName'];
    isFromBot = json['isFromBot'] ?? true;
    type = json['type'];
    createdAt = DateTime.tryParse(json['createdAt'] ?? '');
  }
  String? id;
  String? content;
  String? fileName;
  bool isFromBot = false;
  String? type;
  DateTime? createdAt;

  Map<String, dynamic> toDto() {
    final map = <String, dynamic>{};
    map['content'] = content;
    map['fileName'] = fileName;
    map['type'] = type;
    map['messageReturn'] = false;
    map['metadata'] = {};
    return map;
  }

  @override
  List<Object?> get props => [id];

}