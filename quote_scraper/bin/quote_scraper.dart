// 1. 导入我们需要的包
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser; // 'parser' 是一个常用的别名

Future<void> main() async {
  print('开始爬取名言...');

  // 2. 设定目标 URL
  final url = Uri.parse('http://quotes.toscrape.com/');

  try {
    // 3. 发起 GET 请求
    final response = await http.get(url);

    // 4. 检查响应状态码 (200 表示成功)
    if (response.statusCode == 200) {
      // 5. 使用 'html' 包解析 HTML 响应体
      final document = parser.parse(response.body);

      // 6. 使用 CSS 选择器查找所有名言
      //    (通过在浏览器中 "右键 -> 检查" 我们可以找到名言的 class 是 'quote')
      final quoteElements = document.querySelectorAll('.quote');

      print('爬取成功！\n');

      // 7. 遍历找到的元素
      for (var element in quoteElements) {
        // 7.1 提取名言文本 (class='text')
        final text = element.querySelector('.text')?.text;
        
        // 7.2 提取作者 (class='author')
        final author = element.querySelector('.author')?.text;

        if (text != null && author != null) {
          // 8. 打印结果
          print('名言: $text');
          print('作者: -- $author\n');
        }
      }
    } else {
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}