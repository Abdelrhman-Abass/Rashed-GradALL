class Chat {
  Chat({
      this.id, 
      this.title, 
      this.isActive, 
      this.createdAt, 
      this.updatedAt, 
      this.endedAt,});

  Chat.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    endedAt = json['endedAt'];
  }
  String? id;
  String? title;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? endedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['isActive'] = isActive;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['endedAt'] = endedAt;
    return map;
  }

}