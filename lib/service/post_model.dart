class PostModel {
  String? title;
  String? firstName;
  String? lastName;
  String? age;
  String? note1;
  String? note2;
  String? guid;
  String? userName;
  String? password;
  String? confirmPassword;
  bool? acceptTerms;

  PostModel(
      {this.title,
      this.firstName,
      this.lastName,
      this.age,
      this.note1,
      this.note2,
      this.guid,
      this.userName,
      this.password,
      this.confirmPassword,
      this.acceptTerms});

  PostModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    note1 = json['note1'];
    note2 = json['note2'];
    guid = json['guid'];
    userName = json['userName'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    acceptTerms = json['acceptTerms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['age'] = age;
    data['note1'] = note1;
    data['note2'] = note2;
    data['guid'] = guid;
    data['userName'] = userName;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['acceptTerms'] = acceptTerms;
    return data;
  }
}
