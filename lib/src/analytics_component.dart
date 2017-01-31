import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:alert/alert_service.dart';
import 'package:js/js.dart';

import 'package:resources_loader/resources_loader.dart';

@Component(selector: 'analytics')
@View(
    templateUrl: 'analytics_component.html',
    directives: const [RouterLink])
class AnalyticsComponent implements OnInit {
  static const String route_name = "Analytics";
  static const String route_path = "analytics";
  static const Route route = const Route(
      path: AnalyticsComponent.route_path,
      component: AnalyticsComponent,
      name: AnalyticsComponent.route_name);

  final Router _router;
  final AlertService _alertService;
  final ResourcesLoaderService _resourcesLoaderService;

  AnalyticsComponent(this._router, this._alertService, this._resourcesLoaderService) {}

  @override
  void ngOnInit() {
    _resourcesLoaderService.loadScript('vendor/chart.js/dist/', 'Chart.min.js', false);
    _resourcesLoaderService.loadScript('packages/analytics/src/', 'init-analytics.js', false);
  }
}
