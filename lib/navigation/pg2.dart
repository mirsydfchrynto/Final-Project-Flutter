import 'package:flutter/material.dart';
import 'package:final_project/services/user_service.dart';
import 'package:final_project/services/get_users.dart';

class Pg2 extends StatefulWidget {
  const Pg2({super.key});

  @override
  State<Pg2> createState() => _Page1State();
}

class _Page1State extends State<Pg2> {
  late Future<List<GetUsers>> futureUsers;
  final UserService _userService = UserService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUsers = _userService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("GET RestAPI")),
        body: Center(
          child: FutureBuilder<List<GetUsers>>(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error : ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('User Not Found'));
              }

              final users = snapshot.data!;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text('${user.firstname} ${user.lastname}'),
                    subtitle: Text('${user.email}'),
                  );
                },
              );
            },
          ),
        ));
  }
}
