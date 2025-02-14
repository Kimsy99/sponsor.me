<%
    if(session.getAttribute("admin")==null)
    {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="sponsorme.ConnectionManager" %>
<%@ page import="sponsorme.model.Admin" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sponsor.me</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="../styles/header.css" />
    <link rel="stylesheet" href="./admin.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!--Load the AJAX API-->
    <script
            type="text/javascript"
            src="https://www.gstatic.com/charts/loader.js"
    ></script>

    <%
        Connection connection = ConnectionManager.getConnection();

        //query for project
        Statement stm_project = connection.createStatement();
        String sql_project = "select category, count(*) as count_project\n" + "from sponsorme.project\n" + "group by category";
        ResultSet rs_project = stm_project.executeQuery(sql_project);

        //query for user
        Statement stm_user = connection.createStatement();
        String sql_user = "select registration_date, count(*) as count_user\n" + "from sponsorme.user\n" + "group by registration_date";
        ResultSet rs_user = stm_user.executeQuery(sql_user);
    %>

    <!--Script for pie chart of project-->
    <script type="text/javascript">
        //https://developers.google.com/chart/interactive/docs/quick_start

        // Load the Visualization API and the corechart package.
        google.charts.load('current', { packages: ['corechart'] });

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart()
        {
            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Categories');
            data.addColumn('number', 'projects');
            data.addRows([
                <%
                int totalProject = 0;
                while(rs_project.next())
                {
                      totalProject += rs_project.getInt("count_project");
                %>
                ['<%=rs_project.getString("category")%>', <%=rs_project.getInt("count_project")%>],
                <%
                }
                %>
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

    </script>

    <!--Script for graph of accumulate user-->
    <script type="text/javascript">
        google.charts.load('current', { packages: ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Date', 'Active Users'],
                <%
                int accumulateUser = 0;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String startingDate = "2020-12-01";
                Calendar date = Calendar.getInstance();

                rs_user.first();

                boolean isSameDay;
                Calendar date2 = Calendar.getInstance();
                date2.setTime(rs_user.getDate("registration_date"));

                for (date.setTime(sdf.parse(startingDate)); date.before(Calendar.getInstance()); date.add(Calendar.DATE, 1))
                {
                  isSameDay = date.get(Calendar.DAY_OF_YEAR) == date2.get(Calendar.DAY_OF_YEAR) &&
                              date.get(Calendar.YEAR) == date2.get(Calendar.YEAR);

                  if(isSameDay)
                  {
                    accumulateUser += rs_user.getInt("count_user");
                    if(rs_user.next())
                    {
                        date2.setTime(rs_user.getDate("registration_date"));
                    }
                  }
                %>
                ['<%=sdf.format(date.getTime())%>', <%=accumulateUser%>],
                <%
                }
                %>
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
    </script>

    <!--Script for graph of new user-->
    <script type="text/javascript">
        google.charts.load('current', { packages: ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart()
        {
            var data = google.visualization.arrayToDataTable([
                ['Date', 'New Users'],
                <%
                rs_user.first();
                date2.setTime(rs_user.getDate("registration_date"));
                isSameDay = false;
                int newUser;

                for (date.setTime(sdf.parse(startingDate)); date.before(Calendar.getInstance()); date.add(Calendar.DATE, 1))
                {
                  isSameDay = date.get(Calendar.DAY_OF_YEAR) == date2.get(Calendar.DAY_OF_YEAR) &&
                              date.get(Calendar.YEAR) == date2.get(Calendar.YEAR);

                  if(isSameDay)
                  {
                    newUser = rs_user.getInt("count_user");
                    if(rs_user.next())
                    {
                        date2.setTime(rs_user.getDate("registration_date"));
                    }
                  }
                  else
                  {
                      newUser = 0;
                  }
                %>
                ['<%=sdf.format(date.getTime())%>', <%=newUser%>],
                <%
                }
                %>
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
    </script>

</head>
<body>
<svg style="display: none">
    <symbol id="down" viewBox="0 0 16 16">
        <polygon
                points="3.81 4.38 8 8.57 12.19 4.38 13.71 5.91 8 11.62 2.29 5.91 3.81 4.38"
        />
    </symbol>
    <symbol id="users" viewBox="0 0 16 16">
        <path
                d="M8,0a8,8,0,1,0,8,8A8,8,0,0,0,8,0ZM8,15a7,7,0,0,1-5.19-2.32,2.71,2.71,0,0,1,1.7-1,13.11,13.11,0,0,0,1.29-.28,2.32,2.32,0,0,0,.94-.34,1.17,1.17,0,0,0-.27-.7h0A3.61,3.61,0,0,1,5.15,7.49,3.18,3.18,0,0,1,8,4.07a3.18,3.18,0,0,1,2.86,3.42,3.6,3.6,0,0,1-1.32,2.88h0a1.13,1.13,0,0,0-.27.69,2.68,2.68,0,0,0,.93.31,10.81,10.81,0,0,0,1.28.23,2.63,2.63,0,0,1,1.78,1A7,7,0,0,1,8,15Z"
        />
    </symbol>
    <symbol id="projects" viewBox="0 0 16 16">
        <rect width="7" height="7" />
        <rect y="9" width="7" height="7" />
        <rect x="9" width="7" height="7" />
        <rect x="9" y="9" width="7" height="7" />
    </symbol>
    <symbol id="charts" viewBox="0 0 16 16">
        <polygon
                points="0.64 7.38 -0.02 6.63 2.55 4.38 4.57 5.93 9.25 0.78 12.97 4.37 15.37 2.31 16.02 3.07 12.94 5.72 9.29 2.21 4.69 7.29 2.59 5.67 0.64 7.38"
        />
        <rect y="9" width="2" height="7" />
        <rect x="12" y="8" width="2" height="8" />
        <rect x="8" y="6" width="2" height="10" />
        <rect x="4" y="11" width="2" height="5" />
    </symbol>
    <symbol id="comments" viewBox="0 0 16 16">
        <path d="M0,16.13V2H15V13H5.24ZM1,3V14.37L5,12h9V3Z" />
        <rect x="3" y="5" width="9" height="1" />
        <rect x="3" y="7" width="7" height="1" />
        <rect x="3" y="9" width="5" height="1" />
    </symbol>
    <symbol id="pages" viewBox="0 0 16 16">
        <rect
                x="4"
                width="12"
                height="12"
                transform="translate(20 12) rotate(-180)"
        />
        <polygon points="2 14 2 2 0 2 0 14 0 16 2 16 14 16 14 14 2 14" />
    </symbol>
    <symbol id="appearance" viewBox="0 0 16 16">
        <path
                d="M3,0V7A2,2,0,0,0,5,9H6v5a2,2,0,0,0,4,0V9h1a2,2,0,0,0,2-2V0Zm9,7a1,1,0,0,1-1,1H9v6a1,1,0,0,1-2,0V8H5A1,1,0,0,1,4,7V6h8ZM4,5V1H6V4H7V1H9V4h1V1h2V5Z"
        />
    </symbol>
    <symbol id="trends" viewBox="0 0 16 16">
        <polygon
                points="0.64 11.85 -0.02 11.1 2.55 8.85 4.57 10.4 9.25 5.25 12.97 8.84 15.37 6.79 16.02 7.54 12.94 10.2 9.29 6.68 4.69 11.76 2.59 10.14 0.64 11.85"
        />
    </symbol>
    <symbol id="settings" viewBox="0 0 16 16">
        <rect x="9.78" y="5.34" width="1" height="7.97" />
        <polygon points="7.79 6.07 10.28 1.75 12.77 6.07 7.79 6.07" />
        <rect x="4.16" y="1.75" width="1" height="7.97" />
        <polygon points="7.15 8.99 4.66 13.31 2.16 8.99 7.15 8.99" />
        <rect x="1.28" width="1" height="4.97" />
        <polygon points="3.28 4.53 1.78 7.13 0.28 4.53 3.28 4.53" />
        <rect x="12.84" y="11.03" width="1" height="4.97" />
        <polygon points="11.85 11.47 13.34 8.88 14.84 11.47 11.85 11.47" />
    </symbol>
    <symbol id="options" viewBox="0 0 16 16">
        <path
                d="M8,11a3,3,0,1,1,3-3A3,3,0,0,1,8,11ZM8,6a2,2,0,1,0,2,2A2,2,0,0,0,8,6Z"
        />
        <path
                d="M8.5,16h-1A1.5,1.5,0,0,1,6,14.5v-.85a5.91,5.91,0,0,1-.58-.24l-.6.6A1.54,1.54,0,0,1,2.7,14L2,13.3a1.5,1.5,0,0,1,0-2.12l.6-.6A5.91,5.91,0,0,1,2.35,10H1.5A1.5,1.5,0,0,1,0,8.5v-1A1.5,1.5,0,0,1,1.5,6h.85a5.91,5.91,0,0,1,.24-.58L2,4.82A1.5,1.5,0,0,1,2,2.7L2.7,2A1.54,1.54,0,0,1,4.82,2l.6.6A5.91,5.91,0,0,1,6,2.35V1.5A1.5,1.5,0,0,1,7.5,0h1A1.5,1.5,0,0,1,10,1.5v.85a5.91,5.91,0,0,1,.58.24l.6-.6A1.54,1.54,0,0,1,13.3,2L14,2.7a1.5,1.5,0,0,1,0,2.12l-.6.6a5.91,5.91,0,0,1,.24.58h.85A1.5,1.5,0,0,1,16,7.5v1A1.5,1.5,0,0,1,14.5,10h-.85a5.91,5.91,0,0,1-.24.58l.6.6a1.5,1.5,0,0,1,0,2.12L13.3,14a1.54,1.54,0,0,1-2.12,0l-.6-.6a5.91,5.91,0,0,1-.58.24v.85A1.5,1.5,0,0,1,8.5,16ZM5.23,12.18l.33.18a4.94,4.94,0,0,0,1.07.44l.36.1V14.5a.5.5,0,0,0,.5.5h1a.5.5,0,0,0,.5-.5V12.91l.36-.1a4.94,4.94,0,0,0,1.07-.44l.33-.18,1.12,1.12a.51.51,0,0,0,.71,0l.71-.71a.5.5,0,0,0,0-.71l-1.12-1.12.18-.33a4.94,4.94,0,0,0,.44-1.07l.1-.36H14.5a.5.5,0,0,0,.5-.5v-1a.5.5,0,0,0-.5-.5H12.91l-.1-.36a4.94,4.94,0,0,0-.44-1.07l-.18-.33L13.3,4.11a.5.5,0,0,0,0-.71L12.6,2.7a.51.51,0,0,0-.71,0L10.77,3.82l-.33-.18a4.94,4.94,0,0,0-1.07-.44L9,3.09V1.5A.5.5,0,0,0,8.5,1h-1a.5.5,0,0,0-.5.5V3.09l-.36.1a4.94,4.94,0,0,0-1.07.44l-.33.18L4.11,2.7a.51.51,0,0,0-.71,0L2.7,3.4a.5.5,0,0,0,0,.71L3.82,5.23l-.18.33a4.94,4.94,0,0,0-.44,1.07L3.09,7H1.5a.5.5,0,0,0-.5.5v1a.5.5,0,0,0,.5.5H3.09l.1.36a4.94,4.94,0,0,0,.44,1.07l.18.33L2.7,11.89a.5.5,0,0,0,0,.71l.71.71a.51.51,0,0,0,.71,0Z"
        />
    </symbol>
    <symbol id="collapse" viewBox="0 0 16 16">
        <polygon
                points="11.62 3.81 7.43 8 11.62 12.19 10.09 13.71 4.38 8 10.09 2.29 11.62 3.81"
        />
    </symbol>
    <symbol id="search" viewBox="0 0 16 16">
        <path
                d="M6.57,1A5.57,5.57,0,1,1,1,6.57,5.57,5.57,0,0,1,6.57,1m0-1a6.57,6.57,0,1,0,6.57,6.57A6.57,6.57,0,0,0,6.57,0Z"
        />
        <rect
                x="11.84"
                y="9.87"
                width="2"
                height="5.93"
                transform="translate(-5.32 12.84) rotate(-45)"
        />
    </symbol>
</svg>
<header class="page-header">
    <nav>
        <a href="" class="logo-container">
            <img class="logo" src="../../assets/logo.svg" />
        </a>
        <button
                class="toggle-mob-menu"
                aria-expanded="false"
                aria-label="open menu"
        >
            <svg width="20" height="20" aria-hidden="true">
                <use xlink:href="#down"></use>
            </svg>
        </button>
        <ul class="admin-menu">
            <li class="menu-heading">
                <h3>Admin</h3>
            </li>
            <li>
                <a href="#projects_trend">
                    <svg>
                        <use xlink:href="#projects"></use>
                    </svg>
                    <span>Projects</span>
                </a>
            </li>
            <!-- <li>
              <a href="#0">
                <svg>
                  <use xlink:href="#pages"></use>
                </svg>
                <span>Pages</span>
              </a>
            </li> -->
            <li>
                <a href="#users_trend">
                    <svg>
                        <use xlink:href="#users"></use>
                    </svg>
                    <span>Users</span>
                </a>
            </li>
            <li>
                <a href="#new_users_trend">
                    <svg>
                        <use xlink:href="#trends"></use>
                    </svg>
                    <span>Trends</span>
                </a>
            </li>
            <!-- <li>
              <a href="#0">
                <svg>
                  <use xlink:href="#appearance"></use>
                </svg>
                <span>Appearance</span>
              </a>
            </li> -->
            <!-- <li class="menu-heading">
              <h3>Settings</h3>
            </li>
            <li>
              <a href="#0">
                <svg>
                  <use xlink:href="#settings"></use>
                </svg>
                <span>Settings</span>
              </a>
            </li>
            <li>
              <a href="#0">
                <svg>
                  <use xlink:href="#options"></use>
                </svg>
                <span>Options</span>
              </a>
            </li>
            <li>
              <a href="#0">
                <svg>
                  <use xlink:href="#charts"></use>
                </svg>
                <span>Charts</span>
              </a>
            </li> -->
            <li>
                <button
                        class="collapse-btn"
                        aria-expanded="true"
                        aria-label="collapse menu"
                >
                    <svg aria-hidden="true">
                        <use xlink:href="#collapse"></use>
                    </svg>
                    <span>Collapse</span>
                </button>
            </li>
        </ul>
    </nav>
</header>
<div class="page-content">
    <div class="search-and-user">
        <form>
            <input type="search" placeholder="Search Pages..." style="display: none;"/>
            <button type="submit" aria-label="submit form" style="display: none;">
                <svg aria-hidden="true">
                    <use xlink:href="#search"></use>
                </svg>
            </button>
        </form>
        <div class="admin-profile">
            <span class="greeting">Hello <%=((Admin)session.getAttribute("admin")).username%></span>
            <div class="notifications">
                <svg>
                    <use xlink:href="#users"></use>
                </svg>
            </div>
        </div>
    </div>
    <div class="grid">
        <article id="projects_trend">
            <a href="admin-projects.jsp">
                <h1>Projects</h1>
                <h3>Total projects on platform: <%=totalProject%></h3>
                <div id="project_chart"></div>
            </a>
        </article>
        <article id="users_trend">
            <a href="admin-users.jsp">
                <h1>Users</h1>
                <h3>Total users: <%=accumulateUser%></h3>
                <div id="users_chart"></div
                ></a>
        </article>
        <article id="new_users_trend">
            <h1>New Users trends</h1>
            <h3>Total users: <%=accumulateUser%></h3>
            <div id="new_users_chart"></div>
        </article>
    </div>
    <footer class="page-footer"></footer>
</div>
</body>

<script>
    const body = document.body;
    const menuLinks = document.querySelectorAll('.admin-menu a');
    const collapseBtn = document.querySelector('.admin-menu .collapse-btn');
    const toggleMobileMenu = document.querySelector('.toggle-mob-menu');
    const collapsedClass = 'collapsed';

    collapseBtn.addEventListener('click', function ()
    {
        this.getAttribute('aria-expanded') === 'true'
            ? this.setAttribute('aria-expanded', 'false')
            : this.setAttribute('aria-expanded', 'true');
        this.getAttribute('aria-label') === 'collapse menu'
            ? this.setAttribute('aria-label', 'expand menu')
            : this.setAttribute('aria-label', 'collapse menu');
        body.classList.toggle(collapsedClass);
    });

    toggleMobileMenu.addEventListener('click', function ()
    {
        this.getAttribute('aria-expanded') === 'true'
            ? this.setAttribute('aria-expanded', 'false')
            : this.setAttribute('aria-expanded', 'true');
        this.getAttribute('aria-label') === 'open menu'
            ? this.setAttribute('aria-label', 'close menu')
            : this.setAttribute('aria-label', 'open menu');
        body.classList.toggle('mob-menu-opened');
    });

    for (const link of menuLinks)
    {
        link.addEventListener('mouseenter', function ()
        {
            body.classList.contains(collapsedClass) &&
            window.matchMedia('(min-width: 768px)').matches
                ? this.setAttribute('title', this.textContent)
                : this.removeAttribute('title');
        });
    }
</script>
</html>
