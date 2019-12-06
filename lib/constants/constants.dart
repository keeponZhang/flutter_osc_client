abstract class AppColors {
  //App主题颜色
  static const APP_THEME = 0xff63ca6c;

  //AppBar颜色
  static const APP_BAR = 0xffffffff;
}

abstract class AppUrls {
  //HOST
  static const String HOST = 'https://www.oschina.net';

  //授权登录
  static const String OAUTH2_AUTHORIZE = HOST + '/action/oauth2/authorize';

  //获取token
  static const String OAUTH2_TOKEN = HOST + '/action/openapi/token';
}

abstract class AppInfos {
  //应用id
  static const String CLIENT_ID = '6i4Yu6IUqXnR64em0rsJ';

  //应用密钥
  static const String CLIENT_SECRET = 'Pb9t3prZqBYDeB9DjTvmCzGLu7EFJyt9';

  //回调地址
  static const String REDIRECT_URI = 'https://www.dongnaoedu.com/';
}
