import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ScreenHeader extends StatefulWidget {
  final BuildContext context;
  ScreenHeader({required this.context});

  @override
  _ScreenHeaderState createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> {
  late OverlayEntry overlayEntry;
  @override
  Widget build(BuildContext context) {
    _createOverlayEntry() {
      // RenderObject? renderObject = context.findRenderObject();
      // var size = renderObject!.size;
      // var offset = renderObject.localToGlobal(Offset.zero);

      overlayEntry = OverlayEntry(
          builder: (context) => Positioned(
                left: 40.w,
                top: 10.h,
                width: 50.w,
                child: Material(
                  elevation: 4.0,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        title: Text('Syria'),
                      ),
                      ListTile(
                        title: Text('Lebanon'),
                      )
                    ],
                  ),
                ),
              ));
      Overlay.of(context)!.insert(overlayEntry);
      print('should have dispalyed');
    }

    return Container(
      child: Column(
        children: [
          Row(
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
                onTap: _createOverlayEntry,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
          ),

          // Overlay(initialEntries: [
          //   OverlayEntry(builder: (BuildContext context) {
          //     return Positioned(
          //       top: 0.0,
          //       left: 0.0,
          //       child: Container(
          //         width: 50.w,
          //         height: 10.h,
          //         color: Colors.black,
          //       ),
          //     );
          //   }),
          // ])
        ],
      ),
    );
  }
}
