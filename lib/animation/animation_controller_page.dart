import 'package:flutter/material.dart';

/// 参数                   类型                   默认值     含义
/// value                 double                 null      动画器初始值
/// duration              Duration               null      动画器时长
/// reverseDuration       Duration               null      动画器反向时长
/// lowerBound            double                 0.0       动画器下界
/// upperBound            double                 1.0       动画器上界
/// animationBehavior     AnimationBehavior      normal    动画器行为
/// vsync                 TickerProvider         required  Ticker提供器

/// 方法
/// repeat    开启循环往复动画
/// forward   单次往上界动画
/// reverse   单次往下界动画
/// stop      停止repeat动画 参数为true时可以通过orCancel监听动画取消
/// reset     重置动画器参数
/// fling
///
class AnimationControllerPage extends StatefulWidget {
  const AnimationControllerPage({Key? key}) : super(key: key);

  @override
  _AnimationControllerPageState createState() =>
      _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    lowerBound: 0.4,
    upperBound: 1.0,
    duration: const Duration(seconds: 1),
    reverseDuration: const Duration(seconds: 1),
    // 如果反向时长为null，则使用duration
    animationBehavior: AnimationBehavior.normal,
  );

  // ..addStatusListener((status) {
  //   switch (status) {
  //     case AnimationStatus.forward:
  //       print('forward');
  //       break;
  //     case AnimationStatus.reverse:
  //       print('reverse');
  //       break;
  //     case AnimationStatus.completed:
  //       print('completed 正向结束');
  //       _reverse();
  //       break;
  //     case AnimationStatus.dismissed:
  //       print('dismissed 反向结束');
  //       _startAnim();
  //       break;
  //   }
  // });

  double get radius => 80 * _controller.value;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _repeatAnim() {
    /// repeat 开启的动画可以使用stop方法停止动画
    _controller.repeat(
        reverse: true,
        period: Duration(
          seconds: 1,
        ));
  }

  Widget _buildByAnim(_, __) => Container(
        width: radius * 2,
        height: radius * 2,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: _repeatAnim,
          child: AnimatedBuilder(
            animation: _controller,
            builder: _buildByAnim,
          ),
        ),
      ),
    );
  }
}
