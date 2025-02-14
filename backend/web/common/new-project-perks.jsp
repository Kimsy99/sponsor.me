<%@ page import="sponsorme.model.RewardItem" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%
      if (session.getAttribute("username") == null)
      {
        session.setAttribute("redirect", request.getContextPath() + "/common/new-project.jsp");
        response.sendRedirect(request.getContextPath() + "/common/sign-in-sign-up.jsp");
        return;
      }
    %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/project.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/new-project.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/new-project-perks.css" />
    <link
      href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="header.jsp"/>
  </head>
  <body>
    <div class="new-project-item">
      <h1>Add Perks</h1>
      <form method="post" action="${pageContext.request.contextPath}/new-project-submit">
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

            <%
              ArrayList<RewardItem> rewardItems = (ArrayList<RewardItem>)session.getAttribute("reward_items");
            %>
            
            <div class="perks-item-template">
              <label>Perks Item Name</label>
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
                      style="width: 100%"
                      wrap
                      placeholder="Description..."
                    ></textarea>
                  </div>
                </div>
                <label>Price</label>
                <input
                  type="text"
                  name="price"
                  placeholder="Price"
                  min="1"
                  pattern="^\d*(\.\d{0,2})?$"
                />
                <div class="multi-fields perks-types">
                  <label>Rewards</label>
                  <div class="multi-field perks-reward">
                    <multi-input>
                      <input
                        list="perks"
                        name="perks"
                        class="perks"
                        placeholder="Double click to toggle dropdown"
                      />
                      <datalist id="perks" class="perk-list">
                        <%
                          for (RewardItem rewardItem : rewardItems)
                          {
                            out.write("<option value=\"" + rewardItem.name + "\"></option>");
                          }
                        %>
                      </datalist>
                      <input type="hidden" name="count" id="count" value="0"/>
                    </multi-input>
                  </div>
                </div>
              </div>
            </div>
            <div class="perks-item">
              <label>Perks Item Name</label>
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
                      style="width: 100%"
                      wrap
                      placeholder="Description..."
                    ></textarea>
                  </div>
                </div>
                <label>Price</label>
                <input
                  type="number"
                  name="price"
                  placeholder="Price"
                  min="1"
                  pattern="^\d*(\.\d{0,2})?$"
                />
                <div class="multi-fields perks-types">
                  <label>Rewards</label>
                  <div class="multi-field perks-reward">
                    <multi-input>
                      <input
                        list="perks-0"
                        placeholder="Double click to toggle dropdown"
                      />
                      <datalist id="perks-0">
                        <%
                          for (RewardItem rewardItem : rewardItems)
                            out.write("<option value=\"" + rewardItem.name + "\"></option>");
                        %>
                      </datalist>
                      <input type="hidden" name="count" id="count" value="0"/>
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
  <jsp:include page="footer.jsp"/>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
  <script src="${pageContext.request.contextPath}/js/multi-input.js"></script>
  <script src="${pageContext.request.contextPath}/js/multiple-select.js"></script>
  <script src="${pageContext.request.contextPath}/js/add-perks.js"></script>
</html>
