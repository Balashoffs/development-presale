
import 'package:dart_seq/dart_seq.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:presale/src/di/di.dart';

import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';

class ServiceTypeSelectPage extends StatefulWidget {
  const ServiceTypeSelectPage({super.key});

  @override
  State<ServiceTypeSelectPage> createState() => _ServiceTypeSelectPageState();
}

class _ServiceTypeSelectPageState extends State<ServiceTypeSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 320),
            child: Column(
              spacing: 32.0,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Выберите тип задачи для рассчета', style: TextStyle(
                  fontSize: 16, decoration: TextDecoration.underline,),
                  textAlign: TextAlign.start,
                ),
                MoonButton(
                  width: double.infinity,
                  onTap: () {
                    context.go(designInputRoute);
                  },
                  showBorder: true,
                  label: Text(
                    'Создать КП на проектирование',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                MoonButton(
                  width: double.infinity,
                  onTap: null,
                  showBorder: true,
                  label: Text(
                    'Cправочная информация',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

