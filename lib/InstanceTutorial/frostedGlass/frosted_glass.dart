import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedClassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // 约束盒子，添加额外的约束条件到child上
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg'),
          ),
          Center(
            // 可裁剪矩形
            child: ClipRect(
              // 背景过滤器
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 9.0, sigmaY: 9.0),
                  child: Opacity(
                      opacity: 0.6,
                      child: Container(
                         width: 500.0,
                        height: 700.0,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Center(
                          child: Text('i am center text', style: Theme.of(context).textTheme.display3,),
                        ),
                      ),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
