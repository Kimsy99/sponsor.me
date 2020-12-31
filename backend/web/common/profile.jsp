<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="sponsorme.ConnectionManager" %>
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
    <link rel="stylesheet" href="../styles/preview-item.css" />
    <link rel="stylesheet" href="../styles/footer.css" />
    <link rel="stylesheet" href="../styles/project.css" />
    <link rel="stylesheet" href="../styles/new-project.css" />
    <link rel="stylesheet" href="../styles/profile.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="./header.jsp"/>
  </head>
  <body>
  <%
    Connection connection = ConnectionManager.getConnection();
    Statement stm3 = connection.createStatement();
//    String sql3 = "select count(*) as numberOfBackedProject, user.username as username\n" +
//            "from backed_project as bp left join user ON bp.backer_id = user.user_id \n" +
//            "where backer_id =" + session.getAttribute("uid");
    String sql3 = "select count(*) as numberOfBackedProject, u.username as username\n" +
            "from project as p \n" +
            "left join user as u ON p.creator_id = u.user_id \n"+
            "where p.creator_id = " +  session.getAttribute("uid");
    ResultSet rs3 = stm3.executeQuery(sql3);
    rs3.next();

  %>
    <div class="profile-container">
    <div class="profile-avatar">
      <div class="edit-profile-picture">
        <i class="fa fa-pencil" aria-hidden="true"  onclick="editProfilePic()"></i>
        <img src="../assets/homepage-intro-illustration.png" alt="" />
      </div>
      <div id="insert-profile-picture">
        <!-- insert comments -->
        <div class="insert-profile-picture-content">
          <form id="profile-picture-form" method="post"  action="${pageContext.request.contextPath}/reply">
            <span
                    class="close close-reply"
                    onclick="closeEdit()"
            >&times;</span
            >
            <h3>Reply</h3>
            <input type="file">
            <br />
            <button
                    type="submit"
                    onclick="document.getElementById('reply-comment-form').submit();"
            >
              Submit
            </button>
          </form>
        </div>
      </div>
      <h1><%=rs3.getString("username")%></h1>
      <p>Backed <%=rs3.getInt("numberOfBackedProject")%> projects</p>
    </div>
      <div class="preview-item-container" style="margin: 20px">
        <%
          Statement stm = connection.createStatement();
          String sql = "select p.project_id as pid, project_name, funding_goal, category,SUM(backed_amount) as amount, username\n" +
                  "from project as p left join backed_project as bp ON p.project_id = bp.project_id\n" +
                  "left join user as u ON p.creator_id = u.user_id\n" +
                  "where p.creator_id = " +  session.getAttribute("uid") + "\n" +
                  "group by p.project_id";
          ResultSet rs = stm.executeQuery(sql);
          while(rs.next())
          {
            float percentage = rs.getFloat("amount")/(rs.getFloat("funding_goal"))*100;
        %>
        <a class="project-item <%=rs.getString("category")%>" href="./project-item.jsp?pid=<%=rs.getInt("pid")%>">
          <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
          <div class="project-footer">
            <span class="name"
            ><%=rs.getString("project_name")%></span
            >
            <span class="target-fund">Target Fund: MYR <%=rs.getBigDecimal("funding_goal")%></span>
            <span class="funded-percentage"><%=percentage%>% funded</span>
            <span>By <%=rs.getString("username")%></span>
            <button type="submit">Back Project</button>
          </div></a>

        <%}%>
      </div>
  </div>
  </body>
  <jsp:include page="./footer.jsp"/>

  <script>
    filterSelection('all');

    function removeClass(element, name) {
      let arr1 = element.className.split(' ');
      let arr2 = name.split(' ');
      for (i = 0; i < arr2.length; i++) {
        while (arr1.indexOf(arr2[i]) > -1) {
          arr1.splice(arr1.indexOf(arr2[i]), 1);
        }
      }
      element.className = arr1.join(' ');
    }

    function addClass(element, name) {
      let arr1 = element.className.split(' ');
      let arr2 = name.split(' ');
      for (i = 0; i < arr2.length; i++) {
        if (arr1.indexOf(arr2[i]) == -1) {
          element.className += ' ' + arr2[i];
        }
      }
    }

    function filterSelection(filter) {
      console.log('filter');
      let filterDiv = document.getElementsByClassName('project-item');
      if (filter === 'all') filter = '';
      for (let i = 0; i < filterDiv.length; ++i) {
        removeClass(filterDiv[i], 'show');
        if (filterDiv[i].className.indexOf(filter) > -1) {
          addClass(filterDiv[i], 'show');
        }
      }
    }

    (function ($) {
      'use strict';

      jQuery(window).on('load', function () {
        // preloader();

        // if (jQuery('.gallery-outer .gallery-items').length > 0) {
        //   jQuery('.gallery-outer .gallery-items').filterizr();
        // }
        jQuery('.filter-list button').on('click', function () {
          jQuery('.filter-list button').removeClass('active');
          jQuery(this).addClass('active');
        });
      });

      // function preloader() {
      //   jQuery('.preloaderimg').fadeOut();
      //   jQuery('.preloader')
      //     .delay(200)
      //     .fadeOut('slow')
      //     .delay(200, function () {
      //       jQuery(this).remove();
      //     });
      // }
    })(jQuery);
  </script>
  <script>
    $('.multi-field-wrapper').each(function () {
      var $wrapper = $('.multi-fields', this);
      $('.add-field', $(this)).click(function (e) {
        console.log('add new field');
        $('.multi-field:first-child', $wrapper)
                .clone(true)
                .appendTo($wrapper)
                .find('input, textarea')
                .val('');
      });
      $('.multi-field .remove-field', $wrapper).click(function () {
        console.log('herer');
        if ($('.multi-field', $wrapper).length > 1) {
          console.log('remove fields');
          console.log($(this).parent('.multi-field'));
          $(this).parent('.multi-field').remove();
        }
      });
    });
  </script>
  <script>
    let dropdownContent = document.getElementById('dropdown-content');
    let dropdown = document.getElementsByClassName('dropbtn')[0];

    window.onclick = function (event) {
      if (
              event.target !== dropdownContent &&
              event.target !== dropdown &&
              dropdownContent.style.display === 'block'
      ) {
        console.log('close');
        dropdownContent.style.display = 'none';
        dropdown.style.backgroundColor = '#f1f1f1';
      }
    };
    function toggleProfile() {
      console.log('pressed');
      if (document.getElementById('dropdown-content').style.display != 'block') {
        document.getElementById('dropdown-content').style.display = 'block';
        document.getElementsByClassName('dropdown')[0].style.backgroundColor =
                '#FF8A65';
      } else {
        document.getElementById('dropdown-content').style.display = 'none';
        document.getElementsByClassName('dropdown')[0].style.backgroundColor =
                '#f1f1f1';
      }
    }

  </script>
  <script src="../js/edit-profile-pic.js">
  </script>
</html>
