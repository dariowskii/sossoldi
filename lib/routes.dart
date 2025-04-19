import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/account_page/presentation/account_page.dart';
import 'features/accounts_feature/presentation/account_list.dart';
import 'features/accounts_feature/presentation/add_account.dart';
import 'features/add_page/presentation/add_page.dart';
import 'features/add_category_feature/presentation/add_category.dart';
import 'features/add_category_feature/presentation/category_list.dart';
import 'features/general_options/presentation/general_settings_page.dart';
import 'features/graphs_page/presentation/graphs_page.dart';
import 'features/dashboard_page/presentation/dashboard_page.dart';
import 'pages/more_info_page/collaborators_page.dart';
import 'pages/more_info_page/more_info.dart';
import 'pages/more_info_page/privacy_policy.dart';
import 'pages/notifications/notifications_settings.dart';
import 'pages/onboarding_page/onboarding_page.dart';
import 'pages/planning_page/planning_page.dart';
import 'pages/search_page/search_page.dart';
import 'pages/settings_page.dart';
import 'features/home_page/presentation/home_page.dart';
import 'features/transactions_page/presentation/transactions_page.dart';
import 'pages/planning_page/widget/edit_recurring_transaction.dart';
import 'features/backup_page/presentation/backup_page.dart';

Route<dynamic> makeRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return buildAdaptiveRoute(settings.name, const HomePage());
    case '/onboarding':
      return buildAdaptiveRoute(settings.name, const Onboarding());
    case '/dashboard':
      return buildAdaptiveRoute(settings.name, const DashboardPage());
    case '/add-page':
      final args = settings.arguments as Map<String, dynamic>?;
      return buildAdaptiveRoute(
        settings.name,
        AddPage(
            recurrencyEditingPermitted:
                args?['recurrencyEditingPermitted'] ?? true),
      );
    case '/edit-recurring-transaction':
      return buildAdaptiveRoute(
          settings.name, const EditRecurringTransaction());
    case '/transactions':
      return buildAdaptiveRoute(settings.name, const TransactionsPage());
    case '/category-list':
      return buildAdaptiveRoute(settings.name, const CategoryList());
    case '/add-category':
      return buildAdaptiveRoute(settings.name, const AddCategory());
    case '/more-info':
      return buildAdaptiveRoute(settings.name, const MoreInfoPage());
    case '/privacy-policy':
      return buildAdaptiveRoute(settings.name, const PrivacyPolicyPage());
    case '/collaborators':
      return buildAdaptiveRoute(settings.name, const CollaboratorsPage());
    case '/account':
      return buildAdaptiveRoute(settings.name, const AccountPage());
    case '/account-list':
      return buildAdaptiveRoute(settings.name, const AccountList());
    case '/add-account':
      return buildAdaptiveRoute(settings.name, const AddAccount());
    case '/planning':
      return buildAdaptiveRoute(settings.name, const PlanningPage());
    case '/graphs':
      return buildAdaptiveRoute(settings.name, const GraphsPage());
    case '/settings':
      return buildAdaptiveRoute(settings.name, const SettingsPage());
    case '/general-settings':
      return buildAdaptiveRoute(settings.name, const GeneralSettingsPage());
    case '/notifications-settings':
      return buildAdaptiveRoute(settings.name, const NotificationsSettings());
    case '/search':
      return buildAdaptiveRoute(settings.name, const SearchPage());
    case '/backup-page':
      return buildAdaptiveRoute(settings.name, const BackupPage());
    default:
      throw 'Route is not defined';
  }
}

PageRoute buildAdaptiveRoute(String? routeName, Widget viewToShow) {
  if (Platform.isAndroid) {
    return _materialPageRoute(routeName, viewToShow);
  }

  return _cupertinoPageRoute(routeName, viewToShow);
}

PageRoute _cupertinoPageRoute(String? routeName, Widget viewToShow) {
  return CupertinoPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}

PageRoute _materialPageRoute(String? routeName, Widget viewToShow) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
