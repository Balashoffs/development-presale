import 'package:flutter/services.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/design_class.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_csv.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/extensions.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/resource_csv.dart';

class ResourceDTO implements Comparable<ResourceDTO> {
  final int id;
  final String resourceCode;
  final String resourceName;
  final double resourceCostPerDay;
  final double resourceCostPerHour;
  final double resourceFactor;

  const ResourceDTO({
    required this.id,
    required this.resourceCode,
    required this.resourceName,
    required this.resourceCostPerDay,
    required this.resourceCostPerHour,
    this.resourceFactor = 1.0,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResourceDTO &&
          runtimeType == other.runtimeType &&
          resourceCode == other.resourceCode &&
          resourceName == other.resourceName;

  @override
  int get hashCode => Object.hash(resourceCode, resourceName);

  @override
  int compareTo(ResourceDTO other) {
    return resourceCostPerDay.compareTo(other.resourceCostPerDay);
  }
}

class DivisionDTO {
  final int id;
  final String divisionName;
  final String divisionShortName;
  final String divisionDescription;
  final List<ResourceDTO> resources;

  const DivisionDTO({
    required this.id,
    required this.divisionName,
    required this.divisionShortName,
    required this.divisionDescription,
    required this.resources,
  });

  DivisionDTO copyWith({
    int? id,
    String? divisionName,
    String? divisionShortName,
    String? divisionDescription,
    List<ResourceDTO>? resources,
  }) {
    return DivisionDTO(
      id: id ?? this.id,
      divisionName: divisionName ?? this.divisionName,
      divisionShortName: divisionShortName ?? this.divisionShortName,
      divisionDescription: divisionDescription ?? this.divisionDescription,
      resources: resources ?? this.resources,
    );
  }
}

class ResourcesDTO {
  static Future<Map<String, DivisionDTO>> build(DivisionType type) async {
    List<ResourceCSV> resourcesFromCsv = await ResourceCostDtoBuilder(
      DesignClass.resources,
    ).build((path) => rootBundle.loadString(path));
    String divisionPath = type == DivisionType.working
        ? DesignClass.jobDivisions
        : DesignClass.projectDivisions;
    List<DivisionCSV> divisionsFromCsv = await DivisionCostDtoBuilder(
      divisionPath,
    ).build((path) => rootBundle.loadString(path));
    Map<String, List<ResourceDTO>> allResources = {};
    Map<String, DivisionDTO> divisions = {};

    for (var value in divisionsFromCsv) {
      List<ResourceDTO> resources = resourcesFromCsv
          .where(
            (element) =>
                element.resourceCode.toUpperCase() ==
                value.resourceCode.toUpperCase(),
          )
          .map((e) => e.from())
          .toList();
      allResources.putIfAbsent(value.divisionShortName, () => []);
      allResources[value.divisionShortName]?.addAll(resources);
    }

    for (var value in divisionsFromCsv) {
      if (divisions.containsKey(value.divisionShortName)) continue;
      List<ResourceDTO> resources = allResources[value.divisionShortName] ?? [];
      if (resources.isNotEmpty) {
        DivisionDTO newDivision = value.from(resources);
        divisions.putIfAbsent(newDivision.divisionShortName, () => newDivision);
      }
    }
    return divisions;
  }
}
