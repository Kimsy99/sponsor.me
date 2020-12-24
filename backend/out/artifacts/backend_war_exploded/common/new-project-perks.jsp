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
    <link rel="stylesheet" href="../styles/new-project-perks.css" />
    <link
      href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <div class="header">
      <a href="../index.html" class="logo-container">
        <img class="logo" src="../assets/logo.svg" />
      </a>
      <div class="options">
        <a class="option" href="../common/project.html"> Explore </a>
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
        <a class="option" href="../common/sign-in-sign-up.html"> Sign in </a>
        <div class="dropdown" onclick="toggleProfile()">
          <i class="fa fa-user dropbtn" aria-hidden="true"></i>
          <div class="dropdown-content" id="dropdown-content">
            <div class="account">
              Your Account
              <hr />
              <a href="./my-projects.html">My Projects</a>
              <a href="">Saved Project</a>
              <a href="./profile.html">Profile</a>
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
    <div class="new-project-item">
      <h1>Add Perks</h1>
      <form action="">
        <div class="perks-wrapper">
          <!--faqs-->
          <div class="perks-items">
            <!-- <div class="perks-item-template">
              <label for="Story">Perks Item Name</label>
              <input
                type="text"
                name="perks-name"
                class=""
                placeholder="Name"
              />
              <div class="multi-field-wrapper perks-types-wrapper">
                <label>Perks Description</label>
                <div
                  class="multi-fields-template perks-types-template"
                  style="display: none"
                >
                  <div class="multi-field perks-reward">
                    <input
                      type="text"
                      name="perks"
                      class=""
                      placeholder="Name"
                    />
                  </div>
                </div>
                <div class="multi-fields perks-types">
                  <div class="multi-field perks-reward">
                    <select
                      class="multiple-select"
                      name="perks-reward-item"
                      multiple="multiple"
                    >
                      <option selected disabled>Select reward item</option>
                      <option value="item1">item1</option>
                      <option value="item1">item1</option>
                      <option value="item1">item1</option>
                    </select>
                  </div>
                </div>
              </div>
            </div> -->

            <div class="perks-item-template">
              <label for="Story">Perks Item Name</label>
              <i class="fa fa-window-close remove-field" aria-hidden="true"></i>
              <input
                type="text"
                name="perks-name"
                class=""
                placeholder="Name"
              />
              <div class="multi-field-wrapper perks-types-wrapper">
                <label>Perks Description</label>
                <div class="multi-fields-template perks-types-template">
                  <div class="multi-field perks-reward">
                    <textarea
                      rows="10"
                      cols="50"
                      name="comment"
                      form="usrform"
                      style="width: 100%"
                      wrap
                      placeholder="Description.."
                    ></textarea>
                  </div>
                </div>
                <div class="multi-fields perks-types">
                  <label for="">Rewards</label>
                  <div class="multi-field perks-reward">
                    <multi-input>
                      <input
                        list="speakers"
                        placeholder="Double click to toggle dropdown"
                      />
                      <datalist id="speakers">
                        <option value="Type1"></option>
                        <option value="Type2"></option>
                        <option value="Type3"></option>
                        <option value="Type4"></option>
                        <option value="Type5"></option>
                      </datalist>
                    </multi-input>
                  </div>
                </div>
              </div>
            </div>
            <div class="perks-item">
              <label for="Story">Perks Item Name</label>
              <i class="fa fa-window-close remove-field" aria-hidden="true"></i>
              <input
                type="text"
                name="perks-name"
                class=""
                placeholder="Name"
              />
              <div class="multi-field-wrapper perks-types-wrapper">
                <label>Perks Description</label>
                <div class="multi-fields-template perks-types-template">
                  <div class="multi-field perks-reward">
                    <textarea
                      rows="10"
                      cols="50"
                      name="comment"
                      form="usrform"
                      style="width: 100%"
                      wrap
                      placeholder="Description.."
                    ></textarea>
                  </div>
                </div>
                <div class="multi-fields perks-types">
                  <label for="">Rewards</label>
                  <div class="multi-field perks-reward">
                    <multi-input>
                      <input
                        list="perks"
                        placeholder="Double click to toggle dropdown"
                      />
                      <datalist id="perks">
                        <option value="Type1"></option>
                        <option value="Type2"></option>
                        <option value="Type3"></option>
                        <option value="Type4"></option>
                        <option value="Type5"></option>
                      </datalist>
                    </multi-input>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <button type="button" class="add-perk">Add new perks</button
          ><br /><br />
        </div>

        <input id="submit" type="submit" value="Submit" />
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
  <script src="../js/toggleProfile.js"></script>
  <script src="../js/multi-input.js"></script>
  <script src="../js/multiple-select.js"></script>
  <script src="../js/add-perks.js"></script>
</html>
