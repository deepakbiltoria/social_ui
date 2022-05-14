import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 0),
        child: Column(
          children: [
            //DrawerHeader(child: child),
            Stack(
              children: [
                Image(
                  height: 200,
                  width: double.infinity,
                  image: AssetImage(currentUser.backgroundImageUrl!),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 36,
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundImage:
                              AssetImage(currentUser.profileImageUrl!),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Rebecca',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                )
              ],
            ),

            buildDrawerOption(
              icon: Icon(Icons.dashboard),
              title: 'HOME',
              ontap: () {
                //Navigator.of(context).pop();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            buildDrawerOption(
              icon: Icon(Icons.account_circle),
              title: 'Your Profile',
              ontap: () {
                //Navigator.of(context).pop();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(user: currentUser),
                  ),
                );
              },
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: buildDrawerOption(
                  icon: Icon(Icons.directions_run),
                  title: 'LOGOUT',
                  ontap: () {
                    //Navigator.of(context).pop();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class buildDrawerOption extends StatelessWidget {
  Icon icon;

  String title;

  Function()? ontap;

  buildDrawerOption(
      {required this.icon, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: ontap,
    );
  }
}
