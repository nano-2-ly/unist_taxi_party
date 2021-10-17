
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 50,
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelColor:Colors.deepPurple,
          unselectedLabelColor: Colors.black12,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 18,
              ),
              child: Text(
                '홈', style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size: 18,
              ),
              child: Text(
                '조회', style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.info,
                size: 18,
              ),
              child: Text(
                '설정', style: TextStyle(fontSize: 9),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
