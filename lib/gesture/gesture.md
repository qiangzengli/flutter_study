# 手势

## 竞技场层
GestureArenaManager 竞技场管理者
_GestureArena 竞技场对象
GestureArenaMember 竞技场参赛接口
GestureRecognizer 手势检测器
GestureArenaEntry 竞技场信息发送器 持有GestureArenaManager对象，并由手势检测器间接持有,可通过该对象参赛者可以发送胜利或失败
手势组件 和用户直接接触

## 常用手势
单击 双击 长按 平移  缩放 

## 单击事件介绍

onTap/onTapCancel  无参

onTapDown/onTapUp   TapDownDetails/TapUpDetails对象(类记录的信息一样)

localPosition(Offset) 触点相对于组件左上角的偏移量
globalPosition(Offset) 触点相对于屏幕左上角的偏移量
kind PointerDeviceKind 触点设备类型
touch//点击
mouse//鼠标
stylus//针尖笔
invertedStylus//反向针尖笔
unknown//未知

## 长按事件介绍

onLongPressStart (LongPressStartDetails)
onLongPress ()
onLongPressMoveUpdate (LongPressMoveUpdateDetails)
onLongPressEnd (LongPressEndDetails)
onLongPressUp ()

## 平移事件
onPanDown
onPanStart
onPanUpdate
onPanEnd
onPanCancel

## 缩放事件
onScaleStart
onScaleUpdate
onScaleEnd




