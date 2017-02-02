import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:html';
import 'package:alert/alert_service.dart';
import 'package:js/js.dart';

import 'package:resources_loader/resources_loader.dart';
import 'package:chartjs/chartjs.dart';
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


  /**
   *     var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
      var lineChartData = {
      labels : ['Январь','Февраль','Март','Апрель','Май','Июнь','Июль'],
      datasets : [
      {
      label: 'План 2016',
      backgroundColor : 'rgba(220,220,220,0.2)',
      borderColor : 'rgba(220,220,220,1)',
      pointBackgroundColor : 'rgba(220,220,220,1)',
      pointBorderColor : '#fff',
      data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
      },
      {
      label: 'Факт 2016',
      backgroundColor : 'rgba(151,187,205,0.2)',
      borderColor : 'rgba(151,187,205,1)',
      pointBackgroundColor : 'rgba(151,187,205,1)',
      pointBorderColor : '#fff',
      data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
      }
      ]
      }

      var ctx = document.getElementById('canvas-1');
      var chart = new Chart(ctx, {
      type: 'line',
      data: lineChartData,
      options: {
      responsive: true
      }
      });
   */
  /
  void initChart1(){


    new Chart(querySelector('#canvas-1') as CanvasElement, config);
  }
}
