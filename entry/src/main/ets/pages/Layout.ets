import { Find } from '../components/Find';
import { Mine } from '../components/Mine';
import { Moment } from '../components/Moment';
import { Recommend } from '../components/Recommend';

interface TabClass {
  text: string
  icon: ResourceStr
}

// 跳转页面入口函数
@Builder
export function LayoutBuilder() {
  Layout();
}

@ComponentV2
struct Layout {
  @Local currentIndex: number = 0;
  pathStack: NavPathStack = new NavPathStack();
  tabData: TabClass[] = [
    { text: '推荐', icon: $r('app.media.ic_recommend') },
    { text: '发现', icon: $r('app.media.ic_recommend') },
    { text: '动态', icon: $r('app.media.ic_recommend') },
    { text: '我的', icon: $r('app.media.ic_recommend') },
  ]

  @Builder
  private tabBuilder(item: TabClass, index: number) {
    Column({ space: 5 }) {
      Image(item.icon)
        .width(24)
        .height(24)
        .fillColor(this.currentIndex === index ? '#E85A88' : '#63AAAA')
      Text(item.text)
        .fontSize(14)
        .fontColor(this.currentIndex === index ? '#E85A88' : '#63AAAA')
    }
  }

  build() {
    NavDestination() {
      Tabs() {
        ForEach(this.tabData, (item: TabClass, index: number) => {
          TabContent() {
            if (this.currentIndex === 0) {
              Recommend();
            } else if (this.currentIndex === 1) {
              Find();
            } else if(this.currentIndex === 2) {
              Moment();
            } else if (this.currentIndex === 3) {
              Mine();
            } else {
              // 空白页面
            }
          }
          .tabBar(this.tabBuilder(item, index)) //自定义函数
          .backgroundColor('#131215')
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        })
      }
      .scrollable(false)
      .barPosition(BarPosition.End)
      .barBackgroundColor('#3B3F42')
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}