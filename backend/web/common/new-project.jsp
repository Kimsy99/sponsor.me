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
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="../styles/header.css" />
    <link rel="stylesheet" href="../styles/preview-item.css" />
    <link rel="stylesheet" href="../styles/footer.css" />
    <link rel="stylesheet" href="../styles/project.css" />
    <link rel="stylesheet" href="../styles/new-project.css" />
    <link
      href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <jsp:include page="header.jsp"/>

<%--    <div class="header">--%>
<%--      <a href="../index.jsp" class="logo-container">--%>
<%--        <img class="logo" src="../assets/logo.svg" />--%>
<%--      </a>--%>
<%--      <div class="options">--%>
<%--        <a class="option" href="../common/project.jsp"> Explore </a>--%>
<%--        <div class="option">--%>
<%--          <input--%>
<%--            type="text"--%>
<%--            class="search-bar"--%>
<%--            placeholder="Search.."--%>
<%--            name="search"--%>
<%--          />--%>
<%--          <button type="submit" class="search-button">--%>
<%--            <i class="fa fa-search"></i>--%>
<%--          </button>--%>
<%--        </div>--%>
<%--        <a class="option" href="../common/sign-in-sign-up.jsp"> Sign in </a>--%>
<%--        <div class="dropdown" onclick="toggleProfile()">--%>
<%--          <i class="fa fa-user dropbtn" aria-hidden="true"></i>--%>
<%--          <div class="dropdown-content" id="dropdown-content">--%>
<%--            <div class="account">--%>
<%--              Your Account--%>
<%--              <hr />--%>
<%--              <a href="./my-projects.jsp">My Projects</a>--%>
<%--              <a href="">Saved Project</a>--%>
<%--              <a href="./profile.jsp">Profile</a>--%>
<%--              <a href="">Settings</a>--%>
<%--            </div>--%>
<%--            <br />--%>
<%--            <div class="create-project">--%>
<%--              Created Projects--%>
<%--              <hr />--%>
<%--              <a>--%>
<%--                <div class="mini-project-preview">--%>
<%--                  <img--%>
<%--                    src="./assets/project-categories-header-image/all.jpg"--%>
<%--                    alt=""--%>
<%--                  />--%>
<%--                  <div class="mini-project-preview-content">--%>
<%--                    <h5>Title about the project</h5>--%>
<%--                    <h6>65% funded</h6>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </a>--%>
<%--              <a href="./common/new-project.jsp" class="add-new-project">--%>
<%--                &#43; Add New Project--%>
<%--              </a>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
  </head>
  <body>
    <div class="new-project-item">
      <h1>New Project</h1>
      <form action="">
        <label for="pname">Project Name</label>
        <input
          type="text"
          id="pname"
          name="projectname"
          placeholder="Project name.."
          required="true"
        />

        <label for="project-description">Project Description</label>
        <input
          type="text"
          id="project-description"
          name="project-description"
          placeholder="Project description.."
          required="true"
        />

        <label for="img">Select image:</label>
        <input
          type="file"
          id="img"
          name="img"
          accept="image/*"
          required="true"
        />

        <label for="target-amount">Project Target Amount</label>
        <input
          type="number"
          id="target-amount"
          name="target-amount"
          placeholder="Eg. 4000"
          min="5"
          required="true"
        />

        <label for="category">Category</label>
        <select id="category" name="category">
          <option value="tech">Tech</option>
          <option value="design">Design</option>
          <option value="Film">Film</option>
          <option value="Arts">Arts</option>
          <option value="Publish">Publish</option>
          <option value="food">Food</option>
          <option value="Games">Games</option>
          <option value="others">Others</option>
        </select>

        <label for="stage">Current Stage of project</label>
        <select id="stage" name="stage">
          <option value="concept">Concept</option>
          <option value="prototype">Prototype</option>
          <option value="production">Production</option>
          <option value="shipping">Shipping</option>
        </select>

        <label for="">Project Story</label><br />
        <div id="image-text-box">
          <h3>Team</h3>
          <br />
          <h3>DFds</h3>
          <p><br /></p>
        </div>
        <!-- <button id="save">Save</button> -->

        <!--faqs-->
        <label for="">Frequently Asked Questions</label>
        <div class="multi-field-wrapper">
          <div class="multi-fields">
            <div class="multi-field">
              <input
                type="text"
                name="stuff[]"
                class=""
                placeholder="Question"
              />
              <textarea
                rows="10"
                cols="50"
                name="comment"
                form="usrform"
                style="width: 80%"
                placeholder="Answer"
              ></textarea>
              <br />
              <button type="button" class="remove-field">
                <i class="fas fa-trash-alt"></i>
              </button>
            </div>
          </div>
          <button type="button" class="add-field">Add field</button><br /><br />
        </div>
        <label for="Story">Team Details</label><br />
        <div id="image-text-box2">
          <h3>Team</h3>
          <br />
          <h3>DFds</h3>
          <p><br /></p>
        </div>
        <a href="./new-project-options.jsp"
          ><input id="submit" type="submit" value="Next: Add Rewards"
        /></a>
      </form>
    </div>
  </body>

  <jsp:include page="footer.jsp"/>

<%--  <footer>--%>
<%--    <div class="footer">--%>
<%--      <div class="footer-item-container">--%>
<%--        <div class="menu-items">--%>
<%--          <div class="menu-item">--%>
<%--            <img class="icon" src="../assets/footer-image/Home.svg" />--%>
<%--            <span>Home</span>--%>
<%--          </div>--%>
<%--          <div class="menu-item">--%>
<%--            <img class="icon" src="../assets/footer-image/Projects.svg" />--%>
<%--            <span>Projects</span>--%>
<%--          </div>--%>
<%--          <div class="menu-item">--%>
<%--            <img class="icon" src="../assets/footer-image/Account.svg" />--%>
<%--            <span>Account</span>--%>
<%--          </div>--%>
<%--          <div class="menu-item">--%>
<%--            <img class="icon" src="../assets/footer-image/Help.svg" />--%>
<%--            <span>Help</span>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--        <div class="description">--%>
<%--          <p>Created by Kenneth Tan, Kim Sheng Yong, Chua Tuan Hong</p>--%>
<%--          <p class="copyright">Sponsor.me © 2020</p>--%>
<%--          <p class="tnc">Terms of Service - Privacy Policy</p>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </footer>--%>

  <script src="../js/script.js"></script>
  <script src="../js/faq-text-field.js"></script>
  <script src="../js/toggleProfile.js"></script>
  <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
  <script>
    var quill = new Quill('#image-text-box', {
      theme: 'snow',
    });
    var quill2 = new Quill('#image-text-box2', {
      theme: 'snow',
    });
    console.log({ quill, quill2 });
  </script>
</html>
