import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/following_users.dart';
import 'package:flutter_social_ui/widgets/page_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.list,
                  color: Theme.of(context).primaryColor,
                ))),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'XoXo',
          style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Theme.of(context).primaryColor),
        ),
        bottom: TabBar(
          controller: _tabcontroller,
          indicatorWeight: 3,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(
            fontSize: 15,
          ),
          tabs: [
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            )
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FollowingUsers(),
          PageCarousel(
            pagecontroller: _pageController,
            title: 'Post',
            posts: posts,
          )
        ],
      ),
    );
  }
}
