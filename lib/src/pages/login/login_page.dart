import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_stock/src/configs/app_route.dart';
import 'package:my_stock/src/constants/app_setting.dart';
import 'package:my_stock/src/constants/asset.dart';
import 'package:my_stock/src/pages/login/background_theme.dart';
import 'package:my_stock/src/view_models/sso_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: BackGroundTheme.gradient,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 48,),
                Image.asset(
                  Asset.logoImage,
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
                              keyboardType: TextInputType.emailAddress,
                              controller: _usernameController,
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
                              controller: _passwordController,
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
                    Container(
                      decoration: _boxDecoration(),
                      width: 280,
                      height: 52,
                      child: TextButton(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () async {
                          final username = _usernameController.text;
                          final password = _passwordController.text;
                          if (username == "tanuphong.p@hotmail.com" &&
                              password == "12345678") {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            var token = 'adfasdfadfasffasdfasdklfjafasdlfkajd';
                            await prefs.setString(
                                AppSetting.tokenSetting, token);
                            await prefs.setString(
                                AppSetting.usernameString, username);
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoute.homeRoute,
                            );
                          } else {
                            print('username or password incorrent!!');
                          }
                        },
                      ),
                    ),
                  ],
                ),
                _buildTextButton(
                  'Forgot Password',
                  onPressed: () {
                    //todo
                  },
                ),
                SSOButton(),
                _buildTextButton(
                  'Register',
                  onPressed: () {
                    //todo
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    final gradientStart = BackGroundTheme().gradientStart;
    final gradientEnd = BackGroundTheme().gradientEnd;

    final boxShadowItem = (Color color) => BoxShadow(
      color: color,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    );

    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      boxShadow: <BoxShadow>[
        boxShadowItem(gradientStart),
        boxShadowItem(gradientEnd),
      ],
      gradient: LinearGradient(
        colors: [
          gradientEnd,
          gradientStart,
        ],
        begin: const FractionalOffset(0, 0),
        end: const FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
      ),
    );
  }

  Container _buildTextButton(String text, {VoidCallback onPressed}) => Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
}

class SSOButton extends StatelessWidget {
  const SSOButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: SSOViewModel()
            .item
            .map((item) => FloatingActionButton(
                  heroTag: item.backgroundColor.toString(),
                  onPressed: item.onPressed,
                  child: FaIcon(
                    item.icon,
                    color: item.iconColor,
                  ),
                  backgroundColor: item.backgroundColor,
                ))
            .toList(),
      ),
    );
  }
}
