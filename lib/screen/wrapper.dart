import 'package:flutter/material.dart';
import 'package:movieapp/entities/user.dart';
import 'package:movieapp/screen/home/home.dart';
import 'package:provider/provider.dart';

import 'authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user == null){
      return Authenticate();
    } else {
      return HomePage();
    }

  }
}