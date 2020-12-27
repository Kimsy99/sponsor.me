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
    <!-- <link rel="stylesheet" href="../styles/preview-item.css" /> -->
    <link rel="stylesheet" href="../styles/footer.css" />
    <!-- <link rel="stylesheet" href="../styles/project.css" /> -->
    <link rel="stylesheet" href="../styles/back-project.css" />
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
              <a href="new-project.html" class="add-new-project">
                &#43; Add New Project
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </head>
  <body>
    <div class="back-project">
      <h1>Select an Option below</h1>
      <div >
        <ol class="pledge-plans">
          <li class="pledge-plan">
            <form action="" class="pledge-content">
              <input type="checkbox" class="pledge-checkbox" value="plan3">
              <div class="pledge-info">
                <div class="pledge-info-reward-primary">
                  <div class="pledge-info-reward-primary-description">

                    <h2 class="pledge__amount">
                      <span class="money">MYR  5</span> or more
                    </h2>
                    <h3 class="pledge__title">Carma pledge</h3>
                    <div
                      class="pledge__reward-description pledge__reward-description--expanded"
                    >
                      <p>3x Pages from The Book</p>
  
                      <p>Every little helps!</p>
  
                      <p>
                        This catchy, witty compilation of inventions, filled with
                        beautiful illustrations, is a wonderful gift for
                        collectors, enthusiasts, and curious minds.
                      </p>
                  </div>
                </div>
                <div class="pledge-include">
                  <span
                    class="itemization-includes text-uppercase c-navy-light type-10 medium ls1px block"
                    >Includes:</span
                  >
                  <ul class="list-include">
                    <li class="list-disc">Digital version</li>
                    <li class="list-disc">Digital version</li>
                    <li class="list-disc">Digital version</li>
                  </ul>
                </div></div>
                <div class="pledge-checkout-form">
                    <div class="form-group">
                      <label>Pledge amount</label>
                        <div class="form-input-amount">
                          <div class="new-form-currency-box">
                            <span class="currency-box">MYR </span>
                          </div>
                          <input
                            class="amount-box"
                            tabindex="-1"
                            value="5"
                            type="text"
                            name="backing[amount]"
                            id="backing_amount"
                            data-type="currency" 
                          />
                          
                        </div>
  
                    </div>
                    <button
                      class="bttn bttn-primary theme--create bttn-medium pledge__checkout-submit js-continue js-pledge-button js-reward-continue-button"
                      id="multiple-reward-continue-button-8031595"
                      tabindex="-1"
                    >
                      Continue
                    </button>
                    
                </div>
            </form>
          </li>
          <li class="pledge-plan">
            <form action="" class="pledge-content">
              <input  type="checkbox" class="pledge-checkbox" value="plan3">
              <div class="pledge-info">
                <div class="pledge-info-reward-primary">
                  <div class="pledge-info-reward-primary-description">

                    <h2 class="pledge__amount">
                      <span class="money">MYR  5</span> or more
                    </h2>
                    <h3 class="pledge__title">Carma pledge</h3>
                    <div
                      class="pledge__reward-description pledge__reward-description--expanded"
                    >
                      <p>3x Pages from The Book</p>
  
                      <p>Every little helps!</p>
  
                      <p>
                        This catchy, witty compilation of inventions, filled with
                        beautiful illustrations, is a wonderful gift for
                        collectors, enthusiasts, and curious minds.
                      </p>
                  </div>
                </div>
                <div class="pledge-include">
                  <span
                    class="itemization-includes text-uppercase c-navy-light type-10 medium ls1px block"
                    >Includes:</span
                  >
                  <ul class="list-include">
                    <li class="list-disc">Digital version</li>
                    <li class="list-disc">Digital version</li>
                    <li class="list-disc">Digital version</li>
                  </ul>
                </div></div>
                <div class="pledge-checkout-form">
                    <div class="form-group">
                      <label>Pledge amount</label>
                        <div class="form-input-amount">
                          <div class="new-form-currency-box">
                            <span class="currency-box">MYR </span>
                          </div>
                          <input
                            class="amount-box"
                            tabindex="-1"
                            value="5"
                            type="text"
                            name="backing[amount]"
                            id="backing_amount"
                            data-type="currency" 
                          />
                          
                        </div>
  
                    </div>
                    <button
                      class="bttn bttn-primary theme--create bttn-medium pledge__checkout-submit js-continue js-pledge-button js-reward-continue-button"
                      id="multiple-reward-continue-button-8031595"
                      tabindex="-1"
                    >
                      Continue
                    </button>
                    
                </div>
            </form>
          </li>
          <li class="pledge-plan">
            <form action="" class="pledge-content">
              <input  type="checkbox" class="pledge-checkbox" value="plan3">
              <div class="pledge-info">
                <div class="pledge-info-reward-primary">
                  <div class="pledge-info-reward-primary-description">

                    <h2 class="pledge__amount">
                      <span class="money">MYR  5</span> or more
                    </h2>
                    <h3 class="pledge__title">Carma pledge</h3>
                    <div
                      class="pledge__reward-description pledge__reward-description--expanded"
                    >
                      <p>3x Pages from The Book</p>
  
                      <p>Every little helps!</p>
  
                      <p>
                        This catchy, witty compilation of inventions, filled with
                        beautiful illustrations, is a wonderful gift for
                        collectors, enthusiasts, and curious minds.
                      </p>
                  </div>
                </div>
                <div class="pledge-include">
                  <span
                    class="itemization-includes text-uppercase c-navy-light type-10 medium ls1px block"
                    >Includes:</span
                  >
                  <ul class="list-include">
                    <li class="list-disc">Digital version</li>
                    <li class="list-disc">Digital version</li>
                    <li class="list-disc">Digital version</li>
                  </ul>
                </div></div>
                <div class="pledge-checkout-form">
                    <div class="form-group">
                      <label>Pledge amount</label>
                        <div class="form-input-amount">
                          <div class="new-form-currency-box">
                            <span class="currency-box">MYR </span>
                          </div>
                          <input
                            class="amount-box"
                            tabindex="-1"
                            value="5"
                            type="text"
                            name="backing[amount]"
                            id="backing_amount"
                            data-type="currency" 
                          />
                          
                        </div>
  
                    </div>
                    <button
                      class="bttn bttn-primary theme--create bttn-medium pledge__checkout-submit js-continue js-pledge-button js-reward-continue-button"
                      id="multiple-reward-continue-button-8031595"
                      tabindex="-1"
                    >
                      Continue
                    </button>
                    
                </div>
            </form>
          </li>
          
        </ol>
      </div>
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
  <script src="../js/select-pledge.js"></script>
</html>
