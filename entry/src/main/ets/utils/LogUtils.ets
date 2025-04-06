import { hilog } from "@kit.PerformanceAnalysisKit";

const DOMAIN = 0x0001;

export class LogUtils {
  d(tag: string, msg: string) {
    hilog.debug(DOMAIN, tag, msg);
  }

  i(tag: string, msg: string) {
    hilog.info(DOMAIN, tag, msg);
  }

  e(tag: string, msg: string) {
    hilog.error(DOMAIN, tag, msg);
  }

  w(tag: string, msg: string) {
    hilog.warn(DOMAIN, tag, msg);
  }
}

export default new LogUtils();