import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  const FollowingUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Following',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
        Container(
          height: 80,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              User user = users[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.all(10),
                  child: ClipOval(
                    child: Image(
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                      image: AssetImage(user.profileImageUrl!),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
