import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/MutipleProvidersss/ChnagePasswordProvider.dart';

class ConfirmPassFieldChange extends StatelessWidget {
  const ConfirmPassFieldChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordProvider>(
      builder: (context, passwordVisibilityProvider, child) {
        return Container(
          margin: const EdgeInsets.fromLTRB(10,5,10,10),
          decoration: BoxDecoration(
            color: GradientHelper.getColorFromHex(ColorClass.lightEditText), // Light gray color
            borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
          ),
          child: Container()
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
          //   child: TextFormField(
          //     obscureText: !passwordVisibilityProvider.isPasswordVisible,
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return 'Please enter a Confirm password';
          //       }
          //
          //       return null;
          //     },
          //     controller: passwordVisibilityProvider.passwordController,
          //     decoration: InputDecoration(
          //       hintText: ContentText.password,
          //       hintStyle: StyleClass.textformstyle,
          //       border: InputBorder.none,
          //       prefixIcon: Icon(Icons.lock),
          //       suffixIcon: IconButton(
          //         icon: Icon(passwordVisibilityProvider.isPasswordVisible ? Icons.visibility : Icons.visibility_off),
          //         onPressed: () {
          //           passwordVisibilityProvider.togglePasswordVisibility();
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}
