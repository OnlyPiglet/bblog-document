---
title: "Golang中Context的总结与理解"
date: 2023-01-05T09:36:39+08:00
draft: true
tags: ["go"]
---

一直想理解透Context的用法，Golang有着多种Context，无意中看了下Golang WithCancel类型的Context 底层就是通道的信号传递，打算尝试从各种Context的实现与Channel的使用来理解Context的用法，这种应该是一劳永逸的方法。

```shell
Context(interface)->emptyCtx->BackgroundContext    (CancnelContext)WithCancel
                                              ->   (DeadlineContext)WithDeadline
                                                   (TimeoutContext)WithTimeout
                            -> TODOContext         (ValueContext)WithValue
```



可以看到最终实现有4种功能的上下文，下面一一分析下

CancelContext 的实现



