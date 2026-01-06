import 'package:flutter/material.dart';

class ApiErrorModel {
  final String? errorMessage;
  final int? statuscode;
  final IconData icon;
  final List<String> errors;

  ApiErrorModel({
    required this.errorMessage,
    required this.statuscode,
    required this.icon,
    required this.errors,
  });
}
