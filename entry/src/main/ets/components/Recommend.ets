interface recommendDailyType {
  img: string
  title: string
  type: string
  top: string
  bottom: string
}


@Component
export struct Recommend {
  private swiperList: string[] = [
    'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner1.png',
    'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner2.png',
    'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner3.png',
    'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner4.png',
    'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner5.png'
  ]
  private dailyRecommend: recommendDailyType[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend1.png',
      title: '每日推荐 | 金泰你从《不得不爱》 听起 | 私人雷达',
      type: '每日推荐',
      top: '#660000',
      bottom: '#382e2f'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend2.png',
      title: '从 [Nothing on Me] 开启无线漫游',
      type: '私人推荐',
      top: '#660000',
      bottom: '#382e2f'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend3.png',
      title: '每日推荐 | 金泰你从《不得不爱》 听起 | 私人雷达',
      type: '华语流行',
      top: '#660000',
      bottom: '#382e2f'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend4.png',
      title: '每日推荐 | 金泰你从《不得不爱》 听起 | 私人雷达',
      type: '每日推荐',
      top: '#660000',
      bottom: '#382e2f'
    }
  ]

  @Builder
  private titleBuilder(title: string) {
    Row() {
      Text(title)
        .fontColor('#fff')
        .fontWeight(700)
        .layoutWeight(1)
      Image($r('app.media.ic_more'))
        .width(22)
        .fillColor('#fff')
    }
    .width('100%')
    .height(40)
  }

  build() {
    Column({ space: 10 }) {
      Row() {
        Image($r('app.media.ic_search'))
          .width(22)
          .fillColor('#817D83')
        TextInput({ placeholder: '只因你太美' })
          .layoutWeight(1)
          .placeholderColor('#817D83')
          .padding({ left: 5 })
          .fontColor('#999')
        Image($r('app.media.ic_code'))
          .width(20)
          .fillColor('#817D83')
      }
      .width('100%')
      .backgroundColor('#2D2B29')
      .borderRadius(20)
      .padding({ left: 8, right: 8 })

      Swiper() {
        ForEach(this.swiperList, (item: number, index: number) => {
          Image(item)
            .width('100%')
            .borderRadius(10)

        })
      }
      .autoPlay(true)

      this.titleBuilder('每日推荐');
      List() {
        ForEach(this.dailyRecommend, (item: recommendDailyType, index: number) => {
          ListItem() {
            Column() {
              Text(item.type)
                .padding({ left: 5 })
                .width('100%')
                .height(40)
                .fontColor('#fff')
                .backgroundColor(item.top)
              Image(item.img)
                .width('100%')
              Text(item.title)
                .padding({ left: 5 })
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .width('100%')
                .height(40)
                .fontColor('#fff')
                .backgroundColor(item.bottom)
            }
            .width('40%')
            .borderRadius(10)
            .margin({ right: 10 })
            .clip(true)
          }
        })
      }
      .listDirection(Axis.Horizontal)
    }
    .width('100%')
    .height('100%')
    .padding({
      left: 10,
      right: 10,
      top: 5,
      bottom: 5
    })
  }
}