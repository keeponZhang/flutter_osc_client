Tags： flutter
# 自定义View
[TOC]

---
##1. 概述
与Flutter自带Widget一样，自定义view也会被Skia引擎编译成原生代码，性能是一样的。


##2. 画布Canvas
画布就好比是教室里的黑板，画布是一个矩形区域，可以在上面任意涂鸦。我们可以画点、线、路径、矩形、圆形、图像等。与画布相关的方法主要有：
>* drawLine：画直线
>* drawCircle：画圆
>* drawOval：画椭圆
>* drawRect：画矩形
>* drawPoint：画点
>* drawCircle：画圆

##3 画笔Paint
画笔Paint为绘制方法提供颜色、粗细等参数。

Paint常用属性
|属性名|类型|参考值|说明|
|-|-|-|-|
|color|Color|Colors.blueAccent|画笔颜色|
|strokeCap|StrokeCap|StrokeCap.round|画笔笔触类型|
|isAntiAlias|bool|true|是否启动抗锯齿|
|blendMode|BlendMode|BlendMode.exclusion|颜色混合模式|
|style|PaintingStyle|PaintingStyle.fill|绘画样式|
|colorFilter|ColorFilter|ColorFilter.mode(Colors.blueAccent, BlendMode.exclusion)|颜色渲染模式，一般是矩阵效果来改变的，但是fluter中只能用颜色混合模式|
|maskFilter|MaskFilter|MaskFilter.blur(BlurStyle.inner, 3.0)|模糊遮罩效果，flutter中只有这个|
|filterQuality|FilterQuality|FilterQuality.high|颜色渲染模式的质量|
|strokeWidth|double|16.0|画笔的粗细|

>* 实际使用中不需要传入这么多参数，一般传入画笔颜色、粗细及填充色即可。

