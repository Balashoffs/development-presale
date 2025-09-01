class CollumAttribute {
  final String name;
  final double width;
  final String tooltip;

  CollumAttribute({
    required this.name,
    required this.width,
    required this.tooltip,
  });
}


final List<CollumAttribute> divisionResourceTableAttributes = [
  CollumAttribute(name: '', width: 48.0, tooltip: ''),
  CollumAttribute(name: '№', width: 48.0, tooltip: ''),
  CollumAttribute(name: 'Шифр', width: 64, tooltip: ''),
  CollumAttribute(name: 'Раздел*', width: 312, tooltip: ''),
  CollumAttribute(
    name: 'Должность*',
    width: 312.0,
    tooltip: 'Должность специалиста',
  ),
  CollumAttribute(name: 'Ставка*', width: 128, tooltip: 'Ставка в день'),
  CollumAttribute(
    name: 'ЧЕЛ*',
    width: 88.0,
    tooltip: 'Количество привлеченных специалистов',
  ),
  CollumAttribute(name: 'РД*', width: 72.0, tooltip: 'Рабочие дни'),
  CollumAttribute(name: 'КС', width: 72.0, tooltip: 'Коэфициент по сложности'),
  CollumAttribute(name: 'КП', width: 72.0, tooltip: 'Коэфициент по площади'),
  CollumAttribute(name: 'КУ', width: 72.0, tooltip: 'Коэфициент участия'),
  CollumAttribute(
    name: 'Всего',
    width: 196.0,
    tooltip: 'Всего по конкретной должности',
  ),
];

final List<CollumAttribute> divisionMarginTableAttributes = [
  CollumAttribute(name: '№', width: 64, tooltip: ''),
  CollumAttribute(name: 'Шифр', width: 64, tooltip: ''),
  CollumAttribute(name: 'Раздел', width: 368, tooltip: ''),
  CollumAttribute(
    name: 'СР',
    width: 196.0,
    tooltip: 'Себестоимость раздела',
  ),
  CollumAttribute(
    name: 'КР',
    width: 96.0,
    tooltip: 'Коэфициент накладных расходов',
  ),
  CollumAttribute(name: 'КМ', width: 96.0, tooltip: 'Коэфициент маржинальности'),
  CollumAttribute(name: 'КК', width: 96.0, tooltip: 'Коэфициент клиента'),
  CollumAttribute(
    name: 'Итого',
    width: 196.0,
    tooltip: 'Итого стоимость, без НДС',
  ),
  CollumAttribute(
    name: 'с НДС',
    width: 196.0,
    tooltip: 'Стоимость по разделу с НДС',
  ),
];

final List<CollumAttribute> designOfferTableAttribute = [
  CollumAttribute(name: '№', width: 64.0, tooltip: 'Порядковый номер'),
  CollumAttribute(name: 'Шифр', width: 96.0, tooltip: 'Шифр Раздела'),
  CollumAttribute(
    name: 'Наименование',
    width: double.nan,
    tooltip: 'Наименование раздела'
  ),
  CollumAttribute(
      name: 'Накладные раходы',
      width: 196,
      tooltip: 'Расходы на бэкофис'
  ),
  CollumAttribute(
      name: 'Маржа',
      width: 196,
      tooltip: 'Чистая прибиль'
  ),
  CollumAttribute(
      name: 'Клиент',
      width: 196,
      tooltip: 'Клиентские отчисления'
  ),
  CollumAttribute(
      name: 'Стоимость',
      width: 196,
      tooltip: 'Полная стоимость'
  ),
  CollumAttribute(
    name: 'Стоимость с НДС',
    width: 196,
    tooltip: 'Стоимость с НДС (Итог для раздела)'
  ),
];
