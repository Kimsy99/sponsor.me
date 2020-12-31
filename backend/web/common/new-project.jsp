<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Sponsor.me</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/project.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/new-project.css" />
    <link
      href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <jsp:include page="header.jsp"/>
    
  </head>
  <body>
    <div class="new-project-item">
      <h1>New Project</h1>
      <form method="post" action="${pageContext.request.contextPath}/new-project-options">

        <label for="pname">Project Name</label>
        <input
          type="text"
          id="pname"
          name="pname"
          placeholder="Project name..."
          required
        />

        <label for="project-description">Project Description</label>
        <input
          type="text"
          id="project-description"
          name="project-description"
          placeholder="Project description..."
          required
        />

        <label for="img">Select image:</label>
        <input
          type="file"
          id="img"
          name="img"
          accept="image/*"
          required
        />

        <label for="target-amount">Project Target Amount</label>
        <input
          type="number"
          id="target-amount"
          name="target-amount"
          placeholder="Eg. 4000"
          min="5"
          required
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

        <label for="image-text-box">Project Story</label><br/>
        <div id="image-text-box">
          <h3>Team</h3>
          <br />
          <h3>DFds</h3>
          <p><br /></p>
        </div>
        <!-- <button id="save">Save</button> -->

        <!--faqs-->
        <label>Frequently Asked Questions</label>
        <div class="multi-field-wrapper">
          <div class="multi-fields">
            <div class="multi-field">
              <input
                type="text"
                name="question"
                class=""
                placeholder="Question"
              />
              <textarea
                rows="10"
                cols="50"
                name="answer"
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
        <label for="image-text-box2">Team Details</label><br/>
        <div id="image-text-box2">
          <h3>Team</h3>
          <br />
          <h3>DFds</h3>
          <p><br /></p>
        </div>
        <input type="submit" value="Next: Add Rewards">
<%--        <input type="submit" onclick="document.getElementById('new-project-item-form').submit();" value="Next: Add Rewards">--%>
      </form>
    </div>
  </body>

  <footer>
    <jsp:include page="footer.jsp"/>
  </footer>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/faq-text-field.js"></script>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
  <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
  <script>
    const quill = new Quill('#image-text-box', {
      theme: 'snow',
    });
    const quill2 = new Quill('#image-text-box2', {
      theme: 'snow',
    });
    console.log({ quill, quill2 });
  </script>
</html>
