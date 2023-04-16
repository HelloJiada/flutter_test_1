/// <summary>
/// todo:  正则表达式集合类
/// author：zwb
/// dateTime：2021/7/7 17:58
/// filePath：lib/common/utils/regexp_util.dart
/// <summary> 
class RegExps{
  /// todo：手机号 正则
  static RegExp  phoneExp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

  /// todo：手机号 正则
  static RegExp  idExp = RegExp(r"\d{17}[\d|x]|\d{15}");

  /// todo：中文 正则
  static RegExp  chineseExp = RegExp(r"[\u4e00-\u9fa5]");

  /// todo：邮箱 正则
  static RegExp  emailExp = RegExp(r"^\w+([-+.]\w+)*@\w+([-.]\w+)*.\w+([-.]\w+)*$");

  /// todo：URL正则
  static RegExp  urlExp = RegExp(r"^((https|http|ftp|rtsp|mms)?://)[^\s]+");

  /// todo：字母+数字 正则
  static RegExp  numberABCExp = RegExp(r"^[ZA-ZZa-z0-9_]+$");

  /// todo：小写字母+数字 正则
  static RegExp  numberAbcExp = RegExp(r"^[Za-z0-9_]+$");

  /// todo：忽略特殊字符 正则
  static RegExp  ignoreOtherExp = RegExp(r"^[\u4E00-\u9FA5A-Za-z0-9_]+$");
}