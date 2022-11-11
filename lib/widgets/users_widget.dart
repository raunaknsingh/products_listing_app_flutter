import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../model/users_model.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final UsersModel usersModelProvider = Provider.of<UsersModel>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          child: FancyShimmerImage(
            height: size.height * 0.2,
            width: size.width * 0.2,
            errorWidget: const Icon(
              IconlyBold.danger,
              color: Colors.red,
              size: 28,
            ),
            imageUrl: usersModelProvider.avatar!,
            boxFit: BoxFit.fill,
          ),
        ),
        title: Text(
          usersModelProvider.name!,
          style: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(usersModelProvider.email!),
        trailing: Text(
          usersModelProvider.role!,
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
