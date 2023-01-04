import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

enum TextFieldLabel {
  loginId,
  fullname,
  username,
  email,
  password,
  confPassword,
  estate,
  street,
  houseNumber,
  phoneNumber,
  residentStatus,
  country,
  buildingType,
}

Map<TextFieldLabel, dynamic> textFieldLabelNames = {
  TextFieldLabel.loginId: 'Email, user ID or phone number',
  TextFieldLabel.fullname: 'Full name',
  TextFieldLabel.username: 'Username',
  TextFieldLabel.email: 'Email address',
  TextFieldLabel.password: 'Password',
  TextFieldLabel.estate: 'Estate',
  TextFieldLabel.street: 'Street',
  TextFieldLabel.houseNumber: 'House number',
  TextFieldLabel.confPassword: 'Confirm Password',
  TextFieldLabel.phoneNumber: 'Phone number',
  TextFieldLabel.residentStatus: 'Resident\'s status',
  TextFieldLabel.country: 'Country',
  TextFieldLabel.buildingType: 'Building',
};

/// Valid TextField
void validateInput(
  String value, {
  required TextFieldLabel field,
  required VoidCallback onSuccess,
  required ValueSetter<String?> onError,
  String? compareTo,
}) {
  value = value.trim();
  onError(null);

  if (value.isEmpty) {
    return onError('${textFieldLabelNames[field]} can not be empty');
  }

  if (compareTo != null && value != compareTo) {
    return onError('${textFieldLabelNames[field]} did not match');
  }

  // Text Field Validation
  switch (field) {
    case TextFieldLabel.fullname:
      if (isAlpha(value.replaceAll(' ', ''))) return;

      return onError(
          'Please enter a valid ${textFieldLabelNames[field].toLowerCase()}');

    case TextFieldLabel.email:
      if (isEmail(value)) return;

      return onError(
          'Please enter a valid ${textFieldLabelNames[field].toLowerCase()}');

    case TextFieldLabel.phoneNumber:
      if (isNumeric(value)) return;

      return onError(
          'Please enter a valid ${textFieldLabelNames[field].toLowerCase()}');

    default:
  }

  onSuccess();
}
