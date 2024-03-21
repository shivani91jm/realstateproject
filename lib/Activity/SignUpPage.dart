import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/MutipleProvidersss/RegistrationProvider.dart';
import 'package:realstateproject/Widgets/PasswordsWidgets.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<RegistrationProvider>(
        builder: (context, registrationProvider, child) {
        return Form(
          key: registrationProvider.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: registrationProvider.nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: registrationProvider.emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                PasswordField(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    registrationProvider.register(context);
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        );
      }
      )),
    );
  }
}
