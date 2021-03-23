import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF36D1DC),
                  Color(0xFF5B86E5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 48,),
                Image.asset(
                  'assets/images/cdgs-logo.png',
                  width: 300,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Card(
                      margin: EdgeInsets.only(
                        bottom: 24,
                        left: 24,
                        right: 24,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 22, top: 22, right: 22, bottom: 62),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com',
                                labelText: 'username',
                                icon: Icon(Icons.person),
                                border: InputBorder.none,
                              ),
                            ),
                            Divider(
                              height: 28,
                              indent: 22,
                              endIndent: 22,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'password',
                                icon: Icon(Icons.lock),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      height: 52,
                      child: ElevatedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          print('login click!!!!');
                        },
                      ),
                    ),
                  ],
                ),
                Text('login button'),
                Text('forgot password'),
                Text('sso'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
