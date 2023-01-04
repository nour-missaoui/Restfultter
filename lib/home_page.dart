import 'package:flutter/material.dart';
import 'package:forexapp/base_client.dart';
import 'package:forexapp/user.dart';

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
            children: [
              FlutterLogo(size: 72),
              AppButton(
                  operation: 'GET',
                  operationColor: Colors.black87,
                  description: 'Fetch User',
                  onPressed: () async {
                    var response =
                        await BaseClient().get('/user').catchError((err) {});
                    if (response == null) return;

                    var users = userFromJson(response);
                    debugPrint('success get:' + users.length.toString());
                  }),
              AppButton(
                  operation: 'Post',
                  operationColor: Colors.black87,
                  description: 'Add user',
                  onPressed: () async {
                    var user = User(
                        name: 'nour',
                        avatar: '123',
                        createdAt: "aaa",
                        id: "45");
                    debugPrint('success :' + user.name.toString());
                    var response = await BaseClient()
                        .post('/user', user.toJson())
                        .catchError((err) {});
                    if (response == null) return;
                    debugPrint('success post:' + response);
                  }),
              AppButton(
                  operation: 'Edit',
                  operationColor: Colors.black87,
                  description: 'Edit User',
                  onPressed: () async {
                    var id = "2";
                    var user = User(
                      name: 'jasser',
                      avatar: '123',
                    );
                    debugPrint('success :' + user.name.toString());
                    var response = await BaseClient()
                        .edit('/user/$id', user.toJson())
                        .catchError((err) {});
                    if (response == null) return;
                    debugPrint('success put:' + response);
                  }),
              AppButton(
                  operation: 'DELETE',
                  operationColor: Colors.black87,
                  description: 'Delete user',
                  onPressed: () async {
                    var id = "6";
                    var response = await BaseClient()
                        .delete('/user/$id')
                        .catchError((err) {});
                    if (response == null) return;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
