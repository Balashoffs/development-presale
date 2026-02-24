enum ObjectType {
  office(
    'office',
    'Офисное'
  ),
  gemeral(
    'general',
    'Общее'

  ),
  dou(
    'dou',
    'ДОУ'
  );


  const ObjectType(
      this.urlPath,
      this.text,
      );

  final String urlPath;
  final String text;

  static ObjectType fromText(String text) => ObjectType.values.firstWhere((e) => e.text == text);
}
