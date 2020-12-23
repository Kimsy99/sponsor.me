<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sponsor.me</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="styles/intro.css" />
  <link rel="stylesheet" href="styles/header.css" />
  <link rel="stylesheet" href="styles/preview-item.css" />
  <link rel="stylesheet" href="styles/footer.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <div class="header">
    <a href="index.html" class="logo-container">
      <img class="logo" src="./assets/logo.svg" />
    </a>
    <div class="options">
      <a class="option" href="./common/project.html"> Explore </a>
      <div class="option">
        <input type="text" class="search-bar" placeholder="Search.." name="search">
        <button type="submit" class="search-button"><i class="fa fa-search"></i></button>
      </div>
      <a class="option" href="./common/sign-in-sign-up.html">
        Sign in
      </a>

      <div class="dropdown" onclick="toggleProfile()">
        <i class="fa fa-user dropbtn" aria-hidden="true" ></i>
        <div class="dropdown-content" id="dropdown-content">
          <div class="account">
            Your Account
            <hr>
            <a href="./common/my-projects.html">My Projects</a>
            <a href="">Saved Project</a>
            <a href="./common/profile.html">Profile</a>
            <a href="">Settings</a>
          </div>
          <br>
          <div class="create-project">
            Created Projects
            <hr/>
            <a>
              <div class="mini-project-preview">
                <img src="./assets/project-categories-header-image/all.jpg" alt="">
                <div class="mini-project-preview-content">
                  <h5>Title about the project</h5>
                  <h6>65% funded</h6>
                </div>
              </div>
            </a>
            <a href="./common/new-project.html" class="add-new-project">
              &#43; Add New Project
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</head>
<body>
<div class="intro-section">
  <img
          class="intro-image"
          src="./assets/homepage-intro-illustration.png"
          alt="intro-image"
  />
  <div class="intro-text">
    <h1>Sponsor.me</h1>
    <br />
    <p>
      We are a crowdfunding platform for University Students focus on
      creativity. Student may start any creative project here to start to
      get fundings
    </p>
    <a href="./common/new-project.html"><button>Start Project</button></a>
  </div>
</div>
<div class="preview-items">
  <h1>Hot Projects</h1>
  <div class="preview-items-filter text-center">
    <ul class="filter-list">
      <button class="active" onClick="filterSelection('all')">All</button>
      <button onClick="filterSelection('tech')">Tech</button>
      <button onClick="filterSelection('design')">Design</button>
      <button onClick="filterSelection('film')">Film</button>
      <button onClick="filterSelection('arts')">Arts</button>
      <button onClick="filterSelection('publish')">Publish</li>
        <button onClick="filterSelection('food')">Food</button>
        <button onClick="filterSelection('games')">Games</li>
          <button onClick="filterSelection('others')">Others</li>
    </ul>
  </div>
  <div class="preview-item-container">

    <div class="project-item tech">
      <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
      <div class="project-footer">
            <span class="name"
            >Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing
              dust</span
            >
        <span class="target-fund animals">Target Fund: 12</span>
        <span class="funded-percentage">12% funded</span>
        <span>By Kim Labs</span>
        <button type="submit">Back Project</button>
      </div>
    </div>
    <div class="project-item tech">
      <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
      <div class="project-footer">
            <span class="name"
            >Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing
              dust</span
            >
        <span class="target-fund animals">Target Fund: 12</span>
        <span class="funded-percentage">12% funded</span>
        <span>By Kim Labs</span>
        <button type="submit">Back Project</button>
      </div>
    </div>
    <div class="project-item tech">
      <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
      <div class="project-footer">
            <span class="name"
            >Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing
              dust</span
            >
        <span class="target-fund animals">Target Fund: 12</span>
        <span class="funded-percentage">12% funded</span>
        <span>By Kim Labs</span>
        <button type="submit">Back Project</button>
      </div>
    </div>
    <div class="project-item design">
      <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
      <div class="project-footer">
            <span class="name"
            >Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing
              dust</span
            >
        <span class="target-fund animals">Target Fund: 12</span>
        <span class="funded-percentage">12% funded</span>
        <span>By Kim Labs</span>
        <button type="submit">Back Project</button>
      </div>
    </div>
    <div class="project-item arts">
      <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
      <div class="project-footer">
            <span class="name"
            >Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing
              dust</span
            >
        <span class="target-fund animals">Target Fund: 12</span>
        <span class="funded-percentage">12% funded</span>
        <span>By Kim Labs</span>
        <button type="submit">Back Project</button>
      </div>
    </div>




  </div>
</div>
</body>
<footer>
  <div class='footer'>
    <div class='footer-item-container'>
      <div class='menu-items'>
        <div class='menu-item'>
          <img class='icon' src="./assets/footer-image/Home.svg" />
          <span>Home</span>
        </div>
        <div class='menu-item'>
          <img class='icon' src="./assets/footer-image/Projects.svg" />
          <span>Projects</span>
        </div>
        <div class='menu-item'>
          <img class='icon' src="./assets/footer-image/Account.svg" />
          <span>Account</span>
        </div>
        <div class='menu-item'>
          <img class='icon' src="./assets/footer-image/Help.svg" />
          <span>Help</span>
        </div>
      </div>
      <div class='description'>
        <p>Created by Kenneth Tan, Kim Sheng Yong, Chua Tuan Hong</p>
        <p class='copyright'>Sponsor.me © 2020</p>
        <p class='tnc'>Terms of Service - Privacy Policy</p>
      </div>
    </div>
  </div>
</footer>
<script src="./js/script.js"></script>
<script src="./js/toggleProfile.js"></script>
</html>
