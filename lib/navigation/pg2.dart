import 'package:final_project/services/get_users.dart';
import 'package:final_project/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pg2 extends StatefulWidget {
  const Pg2({super.key});

  @override
  State<Pg2> createState() => _Pg2State();
}

class _Pg2State extends State<Pg2> {
  late Future<List<GetUsers>> futureUsers;
  final UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    futureUsers = _userService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Users",
          style: GoogleFonts.sora(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: FutureBuilder<List<GetUsers>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('User  Not Found');
            }

            final users = snapshot.data!;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 156 / 233,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              padding: EdgeInsets.only(
                left: 32,
                right: 32,
                top: 20,
                bottom: 20
              ),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return Container(
                  width: 156,
                  height: 233,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 11.8,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 140,
                          height: 128,
                          decoration: BoxDecoration(
                            color: Color(0xFFC4C4C4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              user.avatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          user.email,
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w400,
                            fontSize: 11   ,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        // Harga
                        Text(
                          'Rp 4.53',
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
