import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:html';
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

  void breadcrumbInit(){
    var  breadcrumbContent = querySelector('#breadcrumbContent') as DivElement;

    if (breadcrumbContent == null)
      return;

    breadcrumbContent.innerHtml = '''
            <li class="breadcrumb-item"><a href="#/master/dashboard">Главная</a></li>
            <li class="breadcrumb-item active">Аналитика</li>
    ''';
  }

  @override
  void ngOnInit() {

    breadcrumbInit();

    _resourcesLoaderService.loadScript('vendor/chart.js/dist/', 'Chart.min.js', false);
    _resourcesLoaderService.loadScript('packages/analytics/src/', 'init-analytics.js', false);
  }
}
