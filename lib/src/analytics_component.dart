import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:html';
import 'package:resources_loader/resources_loader.dart';
import 'package:chartjs/chartjs.dart';


@Component(selector: 'analytics')
@View(
    templateUrl: 'analytics_component.html',
    directives: const [RouterLink])
class AnalyticsComponent implements OnInit {
  static const String route_name = 'Analytics';
  static const String route_path = 'analytics';
  static const Route route = const Route(
      path: AnalyticsComponent.route_path,
      component: AnalyticsComponent,
      name: AnalyticsComponent.route_name);

  final ResourcesLoaderService _resourcesLoaderService;

  AnalyticsComponent(this._resourcesLoaderService) {}

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
  Future ngOnInit() async {

    breadcrumbInit();

    await _resourcesLoaderService.loadScriptAsync('packages/analytics/src/bower_components/chart.js/dist/', 'Chart.min.js', false);

    initChart1();
    initChart2();

  }

  void initChart1(){

    var data1 = <int>[
      28,
      58,
      38,
      98,
      39,
      65,
      98
    ];

    var data2 = <int>[
      33,
      38,
      32,
      61,
      17,
      15,
      37
    ];

    var data = new LinearChartData(labels: <String>['Январь','Февраль','Март','Апрель','Май','Июнь','Июль'],
        datasets: <ChartDataSets>[
      new ChartDataSets(
          label: 'План 2016',
          backgroundColor: 'rgba(220,220,220,0.2)',
          borderColor : 'rgba(220,220,220,1)',
          pointBackgroundColor : 'rgba(220,220,220,1)',
          pointBorderColor : '#fff',
          data: data1),
      new ChartDataSets(
          label: 'Факт 2016',
          backgroundColor : 'rgba(151,187,205,0.2)',
          borderColor : 'rgba(151,187,205,1)',
          pointBackgroundColor : 'rgba(151,187,205,1)',
          pointBorderColor : '#fff',
          data: data2)
    ]);

    var chartOptions = new ChartOptions(
        responsive: true);

    var config =
    new ChartConfiguration(type: 'line', data: data, options: chartOptions);

    new Chart(querySelector('#canvas-1') as CanvasElement, config);
  }

  void initChart2(){

    var data1 = <int>[
      12,
      86,
      13,
      72,
      22,
      63,
      30
    ];

    var data2 = <int>[
      43,
      74,
      93,
      85,
      66,
      36,
      79
    ];

    var data = new LinearChartData(labels: <String>['Январь','Февраль','Март','Апрель','Май','Июнь','Июль'],
        datasets: <ChartDataSets>[
          new ChartDataSets(
              label: '2015',
              backgroundColor : 'rgba(220,220,220,0.5)',
              borderColor : 'rgba(220,220,220,0.8)',
              pointBackgroundColor : 'rgba(220,220,220,1)',
              pointBorderColor : '#fff',
              data: data1),
          new ChartDataSets(
              label: '2016',
              backgroundColor : 'rgba(151,187,205,0.5)',
              borderColor : 'rgba(151,187,205,0.8)',
              pointBackgroundColor : 'rgba(151,187,205,1)',
              pointBorderColor : '#fff',
              data: data2)
        ]);

    var chartOptions = new ChartOptions(
        responsive: true);

    var config =
      new ChartConfiguration(type: 'bar', data: data, options: chartOptions);

    new Chart(querySelector('#canvas-2') as CanvasElement, config);
  }
}