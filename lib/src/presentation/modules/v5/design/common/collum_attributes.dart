class CollumAttribute {
  final int pos;
  final String name;
  final double width;
  final String tooltip;

  CollumAttribute({
    required this.pos,
    required this.name,
    required this.width,
    required this.tooltip,
  });
}

final List<CollumAttribute> divisionResourceTableAttributes = [
  CollumAttribute(pos: 1, name: '', width: 48.0, tooltip: ''),
  CollumAttribute(pos: 2, name: '№', width: 48.0, tooltip: ''),
  CollumAttribute(pos: 3, name: 'Шифр', width: 64, tooltip: ''),
  CollumAttribute(pos: 4, name: 'Раздел*', width: 312, tooltip: ''),
  CollumAttribute(
    pos: 5,
    name: 'Должность*',
    width: 312.0,
    tooltip: 'Должность специалиста',
  ),
  CollumAttribute(
    pos: 6,
    name: 'Ставка*',
    width: 128,
    tooltip: 'Ставка в день',
  ),
  CollumAttribute(
    pos: 7,
    name: 'ЧЕЛ*',
    width: 88.0,
    tooltip: 'Количество привлеченных специалистов',
  ),
  CollumAttribute(pos: 8, name: 'РД*', width: 72.0, tooltip: 'Рабочие дни'),
  CollumAttribute(
    pos: 9,
    name: 'КС',
    width: 72.0,
    tooltip: 'Коэфициент по сложности',
  ),
  CollumAttribute(
    pos: 10,
    name: 'КП',
    width: 72.0,
    tooltip: 'Коэфициент по площади',
  ),
  CollumAttribute(
    pos: 11,
    name: 'КУ',
    width: 72.0,
    tooltip: 'Коэфициент участия',
  ),
  CollumAttribute(
    pos: 12,
    name: 'Всего',
    width: 196.0,
    tooltip: 'Всего по конкретной должности',
  ),
];

final List<CollumAttribute> divisionMarginTableAttributes = [
  CollumAttribute(pos: 1, name: '№', width: 64, tooltip: ''),
  CollumAttribute(pos: 2, name: 'Шифр', width: 64, tooltip: ''),
  CollumAttribute(pos: 3, name: 'Раздел', width: 368, tooltip: ''),
  CollumAttribute(
    pos: 4,
    name: 'СР',
    width: 196.0,
    tooltip: 'Себестоимость раздела',
  ),
  CollumAttribute(
    pos: 5,
    name: 'КР',
    width: 96.0,
    tooltip: 'Коэфициент накладных расходов',
  ),
  CollumAttribute(
    pos: 6,
    name: 'КМ',
    width: 96.0,
    tooltip: 'Коэфициент маржинальности',
  ),
  CollumAttribute(
    pos: 7,
    name: 'КК',
    width: 96.0,
    tooltip: 'Коэфициент клиента',
  ),
  CollumAttribute(
    pos: 8,
    name: 'Итого',
    width: 196.0,
    tooltip: 'Итого стоимость, без НДС',
  ),
  CollumAttribute(
    pos: 9,
    name: 'с НДС',
    width: 196.0,
    tooltip: 'Стоимость по разделу с НДС',
  ),
];

final List<CollumAttribute> designOfferTableAttribute = [
  CollumAttribute(pos: 1, name: '№', width: 64.0, tooltip: 'Порядковый номер'),
  CollumAttribute(pos: 2, name: 'Шифр', width: 64.0, tooltip: 'Шифр Раздела'),
  CollumAttribute(
    pos: 3,
    name: 'Наименование',
    width: 312,
    tooltip: 'Наименование раздела',
  ),
  CollumAttribute(
    pos: 4,
    name: 'Накладные раходы',
    width: 212,
    tooltip: 'Расходы на бэкофис',
  ),
  CollumAttribute(pos: 5, name: 'Маржа', width: 212, tooltip: 'Чистая прибиль'),
  CollumAttribute(
    pos: 6,
    name: 'Клиент',
    width: 212,
    tooltip: 'Клиентские отчисления',
  ),
  CollumAttribute(
    pos: 7,
    name: 'Стоимость',
    width: 212,
    tooltip: 'Полная стоимость',
  ),
  CollumAttribute(
    pos: 8,
    name: 'Стоимость с НДС',
    width: 212,
    tooltip: 'Стоимость с НДС (Итог для раздела)',
  ),
];
