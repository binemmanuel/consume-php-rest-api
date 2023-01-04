import 'dart:convert';

class User {
  int? id;
  String? userId;
  String? email;
  String? phoneNumber;
  String? fullname;
  String? street;
  String? houseNumber;
  String? country;
  String? residentStatus;
  bool? status;
  String? profilePic;
  String? uploadedOn;
  String? createdOn;

  User({
    this.id,
    this.userId,
    this.email,
    this.phoneNumber,
    this.fullname,
    this.street,
    this.houseNumber,
    this.country,
    this.residentStatus,
    this.status,
    this.profilePic,
    this.uploadedOn,
    this.createdOn,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (fullname != null) {
      result.addAll({'fullname': fullname});
    }
    if (street != null) {
      result.addAll({'street': street});
    }
    if (houseNumber != null) {
      result.addAll({'houseNumber': houseNumber});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (residentStatus != null) {
      result.addAll({'residentStatus': residentStatus});
    }
    if (status != null) {
      result.addAll({'status': status == true ? 1 : 0});
    }
    if (profilePic != null) {
      result.addAll({'profilePic': profilePic});
    }
    if (uploadedOn != null) {
      result.addAll({'uploadedOn': uploadedOn});
    }
    if (createdOn != null) {
      result.addAll({'createdOn': createdOn});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      userId: map['userId'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      fullname: map['fullname'],
      street: map['street'],
      houseNumber: map['houseNumber'],
      country: map['country'],
      residentStatus: map['residentStatus'],
      status: map['status'] == 1,
      profilePic: map['profilePic'],
      uploadedOn: map['uploadedOn'],
      createdOn: map['createdOn'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, userId: $userId, email: $email, phoneNumber: $phoneNumber, fullname: $fullname, street: $street, houseNumber: $houseNumber, country: $country, residentStatus: $residentStatus, status: $status, profilePic: $profilePic, uploadedOn: $uploadedOn, createdOn: $createdOn)';
  }
}
