import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:alert/alert_service.dart';
import 'package:js/js.dart';

@Component(selector: 'analytics')
@View(
    templateUrl: 'analytics_component.html',
    directives: const [RouterLink])
class AnalyticsComponent implements OnInit {
  static const String route_name = "AnalyticsList";
  static const String route_path = "AnalyticsList";
  static const Route route = const Route(
      path: AnalyticsComponent.route_path,
      component: AnalyticsComponent,
      name: AnalyticsComponent.route_name);

  final Router _router;
  final AlertService _alertService;

  AnalyticsComponent(this._router, this._alertService) {}

  @override
  void ngOnInit() {}
}
