class ActionModel {
  String? title;
  String? backgroundImage = 'assets/images/send-money.jpg';

  ActionModel({this.title, this.backgroundImage});

  ActionModel.fromMap(Map<String, dynamic> json) {
    title = json['title'];
    backgroundImage = json['backgroundImage'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};

    data['title'] = title;
    data['backgroundImage'] = backgroundImage;
    return data;
  }
}
