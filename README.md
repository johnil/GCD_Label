Render CoreText use GCD

Demo中为了方便测试,写了`NormalLabel`和`GCDLabel`用于对比,对比性能时切换注释即可.

Demo中视图比较简单,只有一个`Label`,肉眼可能无法区分是否卡顿,可以通过使用`Instruments`来检测`UITableview`滑动的FPS. 复杂结构下FPS性能提升显著.
