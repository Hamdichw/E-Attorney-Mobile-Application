import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:g_skeleton/g_skeleton.dart';

class ReloadWidget extends StatefulWidget {
  @override
  _ReloadWidgetState createState() => _ReloadWidgetState();
}

class _ReloadWidgetState extends State<ReloadWidget> {
  final controller =
      SkeletonController(end: Color.fromARGB(255, 107, 107, 107));

  @override
  void initState() {
    super.initState();
    controller.start();

    Future.delayed(Duration(seconds: 20)).then((value) => controller.stop());
  }

  @override
  void dispose() {
    super.dispose();
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            _buildSkeletonItem(context),
            _buildSkeletonItem(context),
            _buildSkeletonItem(context),
            _buildSkeletonItem(context),
            _buildSkeletonItem(context),
            _buildSkeletonItem(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonItem(BuildContext context) {
    final increasing = UniqueKey();
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox.fromSize(
                            size: Size(60, 60),
                            child: Skeleton(controller),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 55),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Skeleton(controller,
                                    increasing: increasing),
                              )),
                          Spacer(),
                          Expanded(
                            flex: 2,
                            child: FractionallySizedBox(
                                widthFactor: 0.7,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Skeleton(controller,
                                      increasing: increasing),
                                )),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 2,
                            child: FractionallySizedBox(
                                widthFactor: 0.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Skeleton(controller,
                                      increasing: increasing),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
