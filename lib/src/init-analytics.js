$(function (){
    'use strict';

    var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
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


    var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
    var barChartData = {
        labels : ['Январь','Февраль','Март','Апрель','Май','Июнь','Июль'],
        datasets : [
            {
                label: '2015',
                backgroundColor : 'rgba(220,220,220,0.5)',
                borderColor : 'rgba(220,220,220,0.8)',
                highlightFill: 'rgba(220,220,220,0.75)',
                highlightStroke: 'rgba(220,220,220,1)',
                data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
            },
            {
                label: '2016',
                backgroundColor : 'rgba(151,187,205,0.5)',
                borderColor : 'rgba(151,187,205,0.8)',
                highlightFill : 'rgba(151,187,205,0.75)',
                highlightStroke : 'rgba(151,187,205,1)',
                data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
            }
        ]
    }
    var ctx = document.getElementById('canvas-2');
    var chart = new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: {
            responsive: true
        }
    });

});