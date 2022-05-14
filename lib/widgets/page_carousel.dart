import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_social_ui/models/post_model.dart';

class PageCarousel extends StatelessWidget {
  PageController pagecontroller;
  String title;
  List<Post> posts;

  PageCarousel(
      {required this.pagecontroller, required this.title, required this.posts});

  Widget _buildPosts(BuildContext context, int index) {
    Post post = posts[index];

    return AnimatedBuilder(
      builder: (BuildContext context, Widget? widget) {
        double value = 1;

        if (pagecontroller.position.haveDimensions) {
          value = (pagecontroller.page! - index);

          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      animation: pagecontroller,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                    //  spreadRadius: 20,
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                width: 300,
                height: 400,
                fit: BoxFit.cover,
                image: AssetImage(post.imageUrl!),
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 110,
              //width: 300,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title!,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      post.location!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              post.likes.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.comment,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              post.comments.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            titzz
            style: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
        Container(
          // color: Colors.red,
          height: 400,
          child: PageView.builder(
              itemBuilder: (context, index) {
                return _buildPosts(context, index);
              },
              itemCount: posts.length,
              controller: pagecontroller),
        ),
      ],
    );
  }
}
