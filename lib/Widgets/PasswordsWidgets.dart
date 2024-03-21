import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/MutipleProvidersss/RegistrationProvider.dart';

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
      builder: (context, passwordVisibilityProvider, child) {
        return TextFormField(
          obscureText: !passwordVisibilityProvider.isPasswordVisible,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            // Add password strength validation if needed
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(passwordVisibilityProvider.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () {
                passwordVisibilityProvider.togglePasswordVisibility();
              },
            ),
          ),
        );
      },
    );
  }
}
