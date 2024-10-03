import 'dart:html' as html;

class TitleService {
  // Method to set the browser tab title
  static void setTitle(String title) {
    html.document.title = title;
  }
}
