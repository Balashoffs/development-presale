enum DivisionType {
  project(
    'design',
    'Проектная документация',
    'ПД',
  ),
  working(
    'working',
    'Рабочая документация',
    'РД',
  );


  const DivisionType(
      this.urlPath,
      this.text,
      this.shortText,
      );

  final String urlPath;
  final String text;
  final String shortText;

  static DivisionType fromShortText(String text) => DivisionType.values.firstWhere((e) => e.shortText == text);
  static DivisionType fromText(String text) => DivisionType.values.firstWhere((e) => e.text == text);
}
