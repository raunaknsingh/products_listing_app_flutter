import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/users_model.dart';
import '../services/api_handler.dart';
import '../widgets/users_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Users Screen',
        ),
      ),
      body: FutureBuilder<List<UsersModel>>(
        future: ApiHandler.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data == null) {
            return const Center(
              child: Text('No users to show'),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Some error occured'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: snapshot.data![index], child: const UsersWidget());
            },
          );
        },
      ),
    );
  }
}
// ListView.builder(
// itemCount: 20,
// itemBuilder: (context, index) {
// return const UsersWidget();
// },
// ),
