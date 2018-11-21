# SelfAdaptionView
### 根据内容获取size
```
NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
CGSize size = [dataArray[i] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, 15) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
        
```
### 根据每个item的size的width加上间隙大小，判断超出屏幕就换行
```
  float sizeWidth = size.width + 10 + spaceWitdh + 10;
  if (sizeWidth > SCREEN_WIDTH) {
      index ++;
      spaceWitdh = 0;
      button.frame = CGRectMake(7 + spaceWitdh, 10+40*index, size.width + 10, 30);
      spaceWitdh = button.frame.size.width + 10;
  }else{
      button.frame = CGRectMake(7 + spaceWitdh, 10+40*index, size.width + 10, 30);
      spaceWitdh = sizeWidth;
  }
```

### 调用方法
```
  NSArray *itemsArr = @[@"这是文本",@"这是文本这是文本",@"这是文本这是文本这是文本",@"这是文本",@"这是文本",@"这是文本",@"这是文本这是文本",@"这是文本",@"这是文本",@"这是文本",@"这是文本",@"这是文本"];
    SelfAdaptionView *adView=[[SelfAdaptionView alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 0)];//高度可以设为0，根据文本自动计算SelfAdaptionView的高度
    [self.view addSubview:adView];
    [adView createView:itemsArr andBlock:^(NSString * _Nonnull itemName) {
        NSLog(@"点击:%@",itemName);
    }];
```
![image](https://github.com/lsfA1/SelfAdaptionView/raw/master/SelfAdaptionView/img/01.png)
