google.charts.load('current', { packages: ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['Date', 'Active Users'],
    ['1/12', 20],
    ['2/12', 30],
    ['3/12', 100],
    ['4/12', 10],
    ['1/12', 20],
    ['2/12', 30],
    ['3/12', 100],
    ['4/12', 10],
    ['1/12', 20],
    ['2/12', 30],
    ['3/12', 100],
    ['4/12', 10],
    ['1/12', 20],
    ['2/12', 30],
    ['3/12', 100],
    ['4/12', 10],
  ]);

  var options = {
    title: 'Users in Sponsor.me',
    curveType: 'function',
    legend: { position: 'bottom' },
  };

  var chart = new google.visualization.LineChart(
    document.getElementById('users_chart')
  );

  chart.draw(data, options);
}
