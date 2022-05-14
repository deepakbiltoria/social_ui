import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/images_Model.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/widgets/curve_clipper.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Image(
                image: Images.getter("login_background"),
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'XoXo',
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '     UserName',
                    //hintStyle: TextStyle(fontSize: 10.0, color: Colors.green),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    icon: Icon(
                      Icons.account_box,
                      size: 30.0,
                    )),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '     Password',
                    //hintStyle: TextStyle(fontSize: 10.0, color: Colors.green),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    icon: Icon(
                      Icons.lock,
                      size: 30.0,
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                height: 40,
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              // even after Align property the container wasnt sticking to the bottom but after applying Expanded it moved to the bottom
              // so Algin and Expanded are working together to move container to the bottom
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.0,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    child: Text(
                      '''Don't, Have an account ? Sign Up''',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
