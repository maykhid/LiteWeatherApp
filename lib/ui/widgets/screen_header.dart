import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class ScreenHeader extends StatefulWidget {
  final BuildContext context;
  ScreenHeader({required this.context});

  @override
  _ScreenHeaderState createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> with RouteAware {
  OverlayEntry? overlayEntry;
  @override
  Widget build(BuildContext context) {
    _createOverlayEntry() {
      overlayEntry = OverlayEntry(builder: (context) => SearchPopUp());
      Overlay.of(widget.context)!.insert(overlayEntry!);
    }

    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      // routeObserver is the global variable we created before
      routeObserver.subscribe(this, ModalRoute.of(widget.context) as PageRoute);
    }

    @override
    void dispose() {
      routeObserver.unsubscribe(this);
      super.dispose();
    }

    @override
    void didPush() {
      // Route was pushed onto navigator and is now topmost route.
      if (overlayEntry != null) overlayEntry!.remove();
    }

    @override
    void didPopNext() {
      // Covering route was popped off the navigator.
      if (overlayEntry != null) overlayEntry!.remove();
    }

    @override
    _toggleSearch() {
      if (overlayEntry == null) {
        _createOverlayEntry();
        // setState(() {});
      } else {
        overlayEntry!.remove();
        overlayEntry = null;
      }
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
                onTap: () {
                  _toggleSearch();
                },
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SearchPopUp extends StatelessWidget {
  const SearchPopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 40.w,
      top: 10.h,
      width: 50.w,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        elevation: 4.0,
        child: Column(
          children: [
// holds the text fie;d
            Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              padding: EdgeInsets.all(2.w),
              height: 10.h,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Location',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

// button
            TextButton(
              onPressed: () {},
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.blueAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
