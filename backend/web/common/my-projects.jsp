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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <div class="header">
      <a href="../index.jsp" class="logo-container">
        <img class="logo" src="../assets/logo.svg" />
      </a>
      <div class="options">
        <a class="option" href="../common/project.jsp"> Explore </a>
        <div class="option">
          <input
            type="text"
            class="search-bar"
            placeholder="Search.."
            name="search"
          />
          <button type="submit" class="search-button">
            <i class="fa fa-search"></i>
          </button>
        </div>
        <a class="option" href="../common/sign-in-sign-up.jsp"> Sign in </a>
        <div class="dropdown" onclick="toggleProfile()">
          <i class="fa fa-user dropbtn" aria-hidden="true"></i>
          <div class="dropdown-content" id="dropdown-content">
            <div class="account">
              Your Account
              <hr />
              <a href="./my-projects.jsp">My Projects</a>
              <a href="">Saved Project</a>
              <a href="./profile.jsp">Profile</a>
              <a href="">Settings</a>
            </div>
            <br />
            <div class="create-project">
              Created Projects
              <hr />
              <a>
                <div class="mini-project-preview">
                  <img
                    src="./assets/project-categories-header-image/all.jpg"
                    alt=""
                  />
                  <div class="mini-project-preview-content">
                    <h5>Title about the project</h5>
                    <h6>65% funded</h6>
                  </div>
                </div>
              </a>
               <a href="./common/new-project.jsp" class="add-new-project"> &#43; Add New Project </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </head>
  <body >
    <h1 style="padding-left: 80px">All my projects</h1>
    <div class="preview-item-container" style="margin: 20px;">
      <a class="project-item" href="./my-project-item.jsp?pid=20">
        <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
        <div class="project-footer">
          <span class="name"
            >Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing
            dust</span
          >
          <span class="target-fund">Target Fund: 12</span>
          <span class="funded-percentage">12% funded</span>
          <span>By Kim Labs</span>
          <button type="submit">Edit Details</button>
        </div>
      </a>

      <a class="project-item" href="./my-project-item.jsp?pid=20">
        <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
        <div class="project-footer">
          <span class="name"
            >Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing
            dust</span
          >
          <span class="target-fund">Target Fund: 12</span>
          <span class="funded-percentage">12% funded</span>
          <span>By Kim Labs</span>
          <button type="submit">Edit Details</button>
        </div>
      </a>
      <a class="project-item" href="./my-project-item.jsp?pid=20">
        <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
        <div class="project-footer">
          <span class="name"
            >Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing
            dust</span
          >
          <span class="target-fund">Target Fund: 12</span>
          <span class="funded-percentage">12% funded</span>
          <span>By Kim Labs</span>
          <button type="submit">Edit Details</button>
        </div>
      </a>
    </div>
  </body>
  <footer>
    <div class="footer">
      <div class="footer-item-container">
        <div class="menu-items">
          <div class="menu-item">
            <img class="icon" src="../assets/footer-image/Home.svg" />
            <span>Home</span>
          </div>
          <div class="menu-item">
            <img class="icon" src="../assets/footer-image/Projects.svg" />
            <span>Projects</span>
          </div>
          <div class="menu-item">
            <img class="icon" src="../assets/footer-image/Account.svg" />
            <span>Account</span>
          </div>
          <div class="menu-item">
            <img class="icon" src="../assets/footer-image/Help.svg" />
            <span>Help</span>
          </div>
        </div>
        <div class="description">
          <p>Created by Kenneth Tan, Kim Sheng Yong, Chua Tuan Hong</p>
          <p class="copyright">Sponsor.me © 2020</p>
          <p class="tnc">Terms of Service - Privacy Policy</p>
        </div>
      </div>
    </div>
  </footer>

  <script src="../js/script.js"></script>
  <script src="../js/faq-text-field.js"></script>
  <script src="../js/toggleProfile.js"></script>
</html>
