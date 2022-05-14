import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/page_carousel.dart';
import 'package:flutter_social_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  User user;

  ProfileScreen({required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PageController _yourpostcontroller;

  late PageController _yourfavoritescontroller;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _yourpostcontroller = PageController(initialPage: 0, viewportFraction: 0.8);
    _yourfavoritescontroller =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      endDrawer: CustomDrawer(),
      drawerEnableOpenDragGesture:
          false, // to disable sliding of the drawer for openDrawer
      endDrawerEnableOpenDragGesture:
          false, // to disable sliding of the drawer for EndopenDrawer

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.user.backgroundImageUrl!),
                  ),
                ),
                Positioned(
                    top: 50,
                    left: 20.0,
                    child: Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Theme.of(context).primaryColor,
                            size: 40,
                          ));
                    })),
                Positioned(
                    top: 50,
                    right: 20.0,
                    child: Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Theme.of(context).primaryColor,
                            size: 40,
                          ));
                    })),
                Positioned(
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 57,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(widget.user.profileImageUrl!),
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Rebecca",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.user.following.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.user.followers.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            PageCarousel(
                pagecontroller: _yourpostcontroller,
                title: 'Your Posts',
                posts: widget.user.posts!),
            PageCarousel(
                pagecontroller: _yourfavoritescontroller,
                title: 'Your Favourites',
                posts: widget.user.favorites!)
          ],
        ),
      ),
    );
  }
}
