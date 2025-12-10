import 'package:flutter/material.dart';

class StackPictureScreen extends StatelessWidget {
  const StackPictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack Picture Screen")),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              child: Image.network(
                'https://i.guim.co.uk/img/media/80ccdffd6c0fc14642138f3a02cd4548dddd8d72/1176_20_3356_2687/master/3356.jpg?width=465&dpr=1&s=none&crop=none',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
