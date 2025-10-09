import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/core/exceptions.dart';
import 'package:presale/src/domain/models/v1/employee/employee.dart';
import 'package:presale/src/domain/models/v1/section/section.dart';
import 'package:presale/src/domain/models/v1/service_stage/service_stage.dart';

abstract class SectionDataSource {
  const SectionDataSource();

  Future<bool> initialize();
  Future<List<Section>> getSections([Map<String, Employee>? employees]);
// Future<bool> loadFromExcel()
}

class SectionDataSourceLocal implements SectionDataSource {
  final DBClient _client;

  const SectionDataSourceLocal(
    this._client,
  );

  @override
  Future<bool> initialize() async {
    final sections = [
      Section(
        stage: ServiceStage.working,
        name: 'Генеральный план',
        shortName: 'ГП',
        employeeString: 'Ведущий архитектор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Генплан и транспорт (при объединении ГП и ТР)',
        shortName: 'ГТ',
        employeeString: 'Ведущий архитектор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Архитектурные решения',
        shortName: 'АР',
        employeeString: 'Архитектор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Архитектурно-строительные решения (при объединении АР и КР)',
        shortName: 'АС',
        employeeString: 'Архитектор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Интерьеры',
        shortName: 'АИ',
        employeeString: 'Руководитель направления архитектуры',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Конструктивные решения. Железобетонные конструкции',
        shortName: 'КЖ',
        employeeString: 'Руководитель направления архитектуры',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Конструктивные решения. Железобетонные конструкции. Фундаменты',
        shortName: 'КЖ0',
        employeeString: 'Руководитель направления архитектуры',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Конструктивные решения. Металлические конструкции',
        shortName: 'КМ',
        employeeString: 'Руководитель направления архитектуры',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Конструктивные решения. Металлические конструкции деталировочные',
        shortName: 'КМД',
        employeeString: 'Руководитель направления архитектуры',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Конструктивные решения. Деревянные конструкции',
        shortName: 'КД',
        employeeString: 'Руководитель направления архитектуры',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Конструктивные решения. Статический расчет',
        shortName: 'КРР',
        employeeString: 'Руководитель направления архитектуры',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Гидротехнические решения',
        shortName: 'ГР',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система электроснабжения. Наружное электроснабжение',
        shortName: 'ЭС',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система электроснабжения. Силовое электрооборудование',
        shortName: 'ЭМ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система электроснабжения. Электроосвещение',
        shortName: 'ЭО',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система электроснабжения. Электроосвещение наружное',
        shortName: 'ЭН',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Электроснабжение инженерных систем',
        shortName: 'ЭИС',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система водоснабжения. Наружные сети',
        shortName: 'НВ',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система водоотведения. Наружные сети',
        shortName: 'НК',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система водоснабжения и водоотведения. Наружные сети',
        shortName: 'НВК',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система водоснабжения и водоотведения. Внутренние сети',
        shortName: 'ВК',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Отопление, вентиляция и кондиционирование воздуха',
        shortName: 'ОВиК',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Теплоснабжение',
        shortName: 'ТС',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Тепломеханические решения (Котельная, ИТП, и т. п.)',
        shortName: 'ТМ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Телефония, Радиофикация, Телеприем',
        shortName: 'РТ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Структурированные кабельные сети',
        shortName: 'СКС',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Автоматизация инженерных систем',
        shortName: 'АИС',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Автоматизация технологических процессов',
        shortName: 'АТП',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Комплексная автоматизация (при объединении АИС и АТП)',
        shortName: 'АК',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Видеонаблюдение',
        shortName: 'ВН',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Охранная сигнализация',
        shortName: 'ОС',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система контроля и учета доступа',
        shortName: 'СКУД',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Наружное газоснабжение',
        shortName: 'ГСН',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Внутреннее газоснабжение',
        shortName: 'ГСВ',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Технологические решения',
        shortName: 'ТХ',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Технологические коммуникации',
        shortName: 'ТК',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Воздухоснабжение',
        shortName: 'ВС',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Холодоснабжение',
        shortName: 'ХС',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Снабжение паром',
        shortName: 'ПС',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Пылеудаление',
        shortName: 'ПУ',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Автоматическая установка пожарной сигнализации,',
        shortName: 'АУПС',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Система оповещения и управления эвакуацией людей при пожаре',
        shortName: 'СОУЭ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Автоматика противопожарной защиты',
        shortName: 'АППЗ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Спецпожаротушение (водяное, порошковое и т. д.)',
        shortName: 'ПТ',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Смета на строительство объектов капитального строительства',
        shortName: 'СД1',
        employeeString: 'Общий итог',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Мониторинг цен на материалы',
        shortName: 'СД2',
        employeeString: 'Общий итог',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Антикоррозийная защита',
        shortName: 'АЗ',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.working,
        name: 'Тепловая изоляция оборудования и трубопроводов',
        shortName: 'ТИ',
        employeeString: 'Моделлер-координатор',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'Пояснительная записка',
        shortName: 'ПЗ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'Схема планировки земельного участка',
        shortName: 'СПОЗУ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'раздел архитектурных решений',
        shortName: 'АР',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'конструктивные и объемно-планировочные решения',
        shortName: 'КР',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'данные об инженерно-техническом обеспечении',
        shortName: 'ИОС',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'проект организации строительства',
        shortName: 'ПОС',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'проект организации работ по сносу и демонтажу',
        shortName: 'ПОД',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'список мероприятий по охране окружающей среды',
        shortName: 'ПМООС',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'перечень мер по пожарной безопасности',
        shortName: '9. МПБ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'меры обеспечения доступа на объект инвалидов',
        shortName: '10. ОДИ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
      Section(
        stage: ServiceStage.project,
        name: 'Смета на строительство объектов капитального строительства',
        shortName: 'СМ',
        employeeString: 'Ведущий инженер-проектировщик',
      ),
    ];
    
    _client.write('sections', sections);
    return true;
  }

  @override
  Future<List<Section>> getSections([Map<String, Employee>? employees]) async {
    return _handleSections(_client.read('sections'));
  }

  List<Section> _handleSections(dynamic response) {
    // if (response !is List<dynamic>) throw ResponseException();
    try {
      List<Section> result = [];
      for (final section in response){
        result.add(Section.fromJson(section));
      }
      return result;
    } catch (e) {
      throw ResponseException(e.toString());
    }
  }
}
