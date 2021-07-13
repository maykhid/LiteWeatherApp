import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ham
          InkWell(
              child: Icon(
            Icons.menu,
            color: Colors.white,
          )),

          // search
          InkWell(
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
