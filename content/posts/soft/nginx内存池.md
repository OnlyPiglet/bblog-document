---
title: "Nginx内存池"
date: 2022-12-16T16:20:40+08:00
draft: true
tags: ["nginx"]
---

## 内存池

### 数据结构说明

![ngx_pool_t_init](/images/ngx_pool_t_init.png)

ngx_pool_data_t 主要用于记录申请的内存块的位置指针，如内存块的结束位置，空闲可用内存的位置。

### 相关函数

#### 新建内存池

```c
ngx_pool_t * ngx_create_pool(size_t size,ngx_log_t  *log);

/**
*** 1. 申请size字节大小内存，如支持内存对齐，则使用内存对齐申请，否则使用 malloc
*** 2. 设置 内存池空闲内存指针，内存池结束指针，初始化 next 指针，与分配失败次数
*** 3. 设置 单次内存分配最大值max 为 当前 free_size or ( ngx_pagesize - 1 ) 中的较小值 ngx_pagesize 根据 getpagesize 系统函数获取
*** 4. 设置当前内存指针所处位置，初始化 chain 链表指针 , 大内存块链表指针(标准为大于max), 内存池回收清理函数链表
*** 5. 设置 内存池的 日志记录器
*/
```



#### 销魂内存池

```c
void ngx_destroy_pool(ngx_pool_t *pool);
/**
*** 1. 遍历 cleanup 清除链表，遍历执行 cleanp->handler(cleanup->data)
*** 2. 遍历大内存块链表 free 进行释放
*** 3. 
***
***
***
**/
```





