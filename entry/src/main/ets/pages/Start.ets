import LogUtils from "../utils/LogUtils";

const TAG = 'Start';

// 跳转页面入口函数
@Builder
export function StartBuilder() {
  Start();
}

@Component
struct Start {
  pathStack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    LogUtils.i(TAG, 'aboutToAppear');
    setTimeout(() => {
      this.pathStack.replacePathByName('Layout', null, false);
    }, 1000);
  }

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.TopEnd }) {
        Image($r('app.media.ad'))
          .height('100%')
          .width('100%')
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        Button('跳过')
          .margin({ right: 5 })
          .backgroundColor(Color.Gray)
          .onClick(() => {
            this.pathStack.replacePathByName('Layout', null, false);
          })
      }
    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}