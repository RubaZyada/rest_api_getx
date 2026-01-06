
import 'package:flutter/material.dart';
import 'package:restapigetx/core/networking/api_error_model.dart';
import 'package:restapigetx/core/networking/local_states_codes.dart';

class ApiErrorFactory {
   static ApiErrorModel get defaultError => ApiErrorModel(
        errorMessage: "Something went wrong",
        statuscode: LocalStatusCodes.defaultError,
        icon: Icons.error,
         errors: ["Error Occured!"]
      );
}