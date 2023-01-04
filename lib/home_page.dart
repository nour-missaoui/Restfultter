import 'package:flutter/material.dart';

import 'app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              FlutterLogo(size: 72),
              AppButton(
                  operation: 'GET',
                  operationColor: Colors.black87,
                  description: 'Fetch User'),
              AppButton(
                  operation: 'Post',
                  operationColor: Colors.black87,
                  description: 'Add user'),
              AppButton(
                  operation: 'Edit',
                  operationColor: Colors.black87,
                  description: 'Edit User'),
              AppButton(
                  operation: 'DELETE',
                  operationColor: Colors.black87,
                  description: 'Delete user'),
            ],
          ),
        ),
      ),
    );
  }
}
