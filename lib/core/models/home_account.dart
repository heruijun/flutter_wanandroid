class HomeAccount {
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  HomeAccount(
      {this.courseId,
      this.id,
      this.name,
      this.order,
      this.parentChapterId,
      this.userControlSetTop,
      this.visible});

  factory HomeAccount.fromJson(Map<String, dynamic> json) {
    return HomeAccount(
      courseId: json['courseId'],
      id: json['id'],
      name: json['name'],
      order: json['order'],
      parentChapterId: json['parentChapterId'],
      userControlSetTop: json['userControlSetTop'],
      visible: json['visible'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['parentChapterId'] = this.parentChapterId;
    data['userControlSetTop'] = this.userControlSetTop;
    data['visible'] = this.visible;
    return data;
  }
}
