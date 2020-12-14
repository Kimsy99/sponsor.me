google.charts.load('current', { packages: ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['Date', 'New Users'],
    ['1/12', 3],
    ['2/12', 45],
    ['3/12', 14],
    ['4/12', 45],
  ]);

  var options = {
    title: 'New Users in Sponsor.me',
    curveType: 'function',
    legend: { position: 'bottom' },
  };

  var chart = new google.visualization.LineChart(
    document.getElementById('new_users_chart')
  );

  chart.draw(data, options);
}
