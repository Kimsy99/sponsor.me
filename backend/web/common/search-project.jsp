<%@ page import="sponsorme.store.ProjectStore" %>
<%@ page import="sponsorme.model.Project" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        String searchStr = request.getParameter("search");
        if (session.getAttribute("username") == null)
            session.setAttribute("redirect", request.getContextPath() + "/common/search-project.jsp?search=" + searchStr);
    %>
    <title>Sponsor.me</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../styles/header.css" />
    <link rel="stylesheet" href="../styles/preview-item.css" />
    <link rel="stylesheet" href="../styles/footer.css" />
    <link rel="stylesheet" href="../styles/project.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="./header.jsp"/>
</head>
<body>
<div class="preview-items">
    <h1>Projects that contain "<%=searchStr%>"</h1>
    <div class="preview-items-filter text-center">
        <ul class="filter-list">
            <button class="active" onClick="filterSelection('all')">All</button>
            <button onClick="filterSelection('tech')">Tech</button>
            <button onClick="filterSelection('design')">Design</button>
            <button onClick="filterSelection('film')">Film</button>
            <button onClick="filterSelection('art')">Arts</button>
            <button onClick="filterSelection('publish')">Publish</button>
            <button onClick="filterSelection('food')">Food</button>
            <button onClick="filterSelection('game')">Games</button>
            <button onClick="filterSelection('others')">Others</button>
        </ul>
    </div>
    <div class="preview-item-container">
        <%
            ArrayList<Project> projects = ProjectStore.getInstance().findProjectsContainingString(searchStr);
            
            for (Project project : projects)
            {
                float percentage = project.getFundingPercentage();
        %>
        <a class="project-item <%=project.category%>" href="${pageContext.request.contextPath}/common/project-item.jsp?pid=<%=project.id%>">
            <img src="${pageContext.request.contextPath}/images/project-pictures/<%=project.picture.name%>" class="image">
            <div class="project-footer">
                <span class="name"><%=project.name%></span>
                <span class="target-fund">Target Fund: MYR <%=project.getFormattedFundingGoal()%></span>
                <span class="funded-percentage"><%=percentage%>% funded</span>
                <span>By <%=project.creatorUsername%></span>
                <span><strong><%=project.category.getDisplayName()%></strong></span>
                <button type="submit">Back Project</button>
            </div>
        </a>
        <%}%>
    </div>
</div>
</body>
<footer>
    <jsp:include page="./footer.jsp"/>
</footer>

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
            jQuery('.filter-list button').on('click', function () {
                jQuery('.filter-list button').removeClass('active');
                jQuery(this).addClass('active');
            });
        });
    })(jQuery);

</script>
<%--  toggle profile--%>
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
</html>
