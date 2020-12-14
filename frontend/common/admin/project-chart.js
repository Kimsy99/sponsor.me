//https://developers.google.com/chart/interactive/docs/quick_start

// Load the Visualization API and the corechart package.
google.charts.load('current', { packages: ['corechart'] });

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {
  // Create the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Categories');
  data.addColumn('number', 'projects');
  data.addRows([
    ['Tech', 3],
    ['Design', 1],
    ['Film', 1],
    ['Arts', 1],
    ['Publish', 2],
    ['Food', 1],
    ['Game', 1],
    ['Others', 2],
  ]);

  // Set chart options
  var options = {
    title: 'All Projects in Sponsor.me',
    width: 500,
    height: 500,
  };

  // Instantiate and draw our chart, passing in some options.
  var chart = new google.visualization.PieChart(
    document.getElementById('project_chart')
  );
  chart.draw(data, options);
}
