import 'package:cook_off_pro/auth_repository.dart';
import 'package:cook_off_pro/router.dart';
import 'package:cook_off_pro/utilities/show_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common/setting_tile.dart';
import 'common/settings_card.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SettingsCard(
                  children: [
                    SettingTile(
                      title: 'Name',
                      // value: ref.watch(pUserName),
                      showArrow: true,
                      roundTop: true,
                      onTap: () {
                        context.goNamed(AppRoute.userName.name);
                      },
                    ),
                    SettingTile(
                      title: 'ID',
                      // value: ref.watch(pUserId) ?? 'Unknown',
                      roundBottom: true,
                    ),
                  ],
                ),
                SettingsCard(
                  children: [
                    SettingTile(
                      title: 'Recoil Settings',
                      roundTop: true,
                      roundBottom: true,
                      showArrow: true,
                      onTap: () async {
                        context.goNamed(AppRoute.settingsRecoil.name);
                      },
                    )
                  ],
                ),
                SettingsCard(
                  children: [
                    SettingTile(
                      title: 'Upload Offer Codes',
                      showArrow: true,
                      roundTop: true,
                      // roundBottom: true,
                      onTap: () async {
                        context.pushNamed(AppRoute.upload.name);
                      },
                    ),
                    SettingTile(
                      title: 'Manage Offers',
                      showArrow: true,
                      roundBottom: true,
                      onTap: () async {
                        context.pushNamed(AppRoute.manage.name);
                      },
                    ),
                  ],
                ),
                SettingsCard(
                  children: [
                    SettingTile(
                      title: 'Version',
                      // value:
                      //     '${ref.watch(pPackageInfo).version}(${ref.watch(pPackageInfo).buildNumber})',
                      hideSplash: true,
                      roundTop: true,
                      roundBottom: true,
                    ),
                  ],
                ),
                // if (ref.watch(pIsChandler).value ?? false)
                SettingsCard(
                  children: [
                    SettingTile(
                      title: 'Reset Temp Codes',
                      // showArrow: true,
                      roundTop: true,
                      roundBottom: true,
                      onTap: () async {
                        // await ref
                        //     .read(pUploadController.notifier)
                        //     .uploadTempCodes();
                      },
                    ),
                  ],
                ),
                // if (ref.watch(pIsChandler).value ?? false)
                SettingsCard(
                  children: [
                    SettingTile(
                      title: 'Sign Out',
                      // showArrow: true,
                      roundTop: true,
                      roundBottom: true,
                      onTap: () async {
                        bool? signOut = await showCustomDialog(
                          context: context,
                          title: 'Sign Out?',
                          message: 'Are you sure you want to sign out?',
                          confirmText: 'Yes, Sign Out',
                        );
                        if (signOut == true) {
                          await ref.read(pAuthRepository).signOut();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
