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
    <link rel="stylesheet" href="../styles/new-project-options.css" />
    <link
      href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
      rel="stylesheet"
    />
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
              <a href="./common/new-project.jsp" class="add-new-project">
                &#43; Add New Project
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </head>
  <body>
    <div class="new-project-item">
      <h1>Add Reward Item</h1>
      <form action="">
        <div class="reward-wrapper">
        <!--faqs-->
          <div class="reward-items">
            <div class="multi-field-template" style="display: none">
                    
              <input
                type="text"
                name="stuff[]"
                class=""
                placeholder="Question"
              />
              <button type="button" class="remove-field"><i class="fas fa-trash-alt"></i></button>
            </div>
            <div class="reward-item reward-item-template" style="display: none;">
              <label for="Story">Reward Item Name</label>
              <i class="fa fa-window-close remove-reward" aria-hidden="true"></i>
              <input
                      type="text"
                      name="option-name"
                      class=""
                      placeholder="Question"
                    />
              <div class="multi-field-wrapper option-types-wrapper">
                <label>Item Option</label>
                <div class="multi-fields-template " style="display: none">
                  <div class="multi-field option-type">
                    
                    <input
                      type="text"
                      name="stuff[]"
                      class=""
                      placeholder="Question"
                    />
                    <button type="button" class="remove-field"><i class="fas fa-trash-alt"></i></button>
                  </div>
                </div>
                <div class="multi-fields option-types">
                  <div class="multi-field option-type">
                    
                    <input
                      type="text"
                      name="stuff[]"
                      class=""
                      placeholder="Question"
                    />
                    <button type="button" class="remove-field"><i class="fas fa-trash-alt"></i></button>
                  </div>
                </div>
                <button type="button" class="add-field add-option"><i class="fa fa-plus" aria-hidden="true"></i></button><br /><br />
              </div>
            </div>
            <div class="reward-item">
              <label for="Story">Reward Item Name</label>
              <i class="fa fa-window-close remove-reward" aria-hidden="true"></i>
              <input
                      type="text"
                      name="option-name"
                      class=""
                      placeholder="Question"
                    />
              <div class="multi-field-wrapper option-types-wrapper">
                <label>Item Option</label>
                <div class="multi-fields-template option-types-template" style="display: none">
                  <div class="multi-field option-type">
                    
                    <input
                      type="text"
                      name="stuff[]"
                      class=""
                      placeholder="Question"
                    />
                    <button type="button" class="remove-field"><i class="fas fa-trash-alt"></i></button>
                  </div>
                </div>
                <div class="multi-fields option-types">
                  <div class="multi-field option-type">
                    
                    <input
                      type="text"
                      name="stuff[]"
                      class=""
                      placeholder="Question"
                    />
                    <button type="button" class="remove-field"><i class="fas fa-trash-alt"></i></button>
                  </div>
                </div>
                <button type="button" class="add-field add-option"><i class="fa fa-plus" aria-hidden="true"></i></button><br /><br />
              </div>
            </div>
          </div>
          <button type="button" class="add-item">Add Reward Item</button><br /><br />
        </div>
        
        <input id="submit" type="submit" value="Next: Add Perks" />
      </form>
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
  <!-- <script src="../js/faq-text-field.js"></script> -->
  <script src="../js/add-reward-item.js"></script>
  <script src="../js/toggleProfile.js"></script>
</html>
