<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Add Inhabitant</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>

    <h2 style="text-align: center"><b>Add a new inhabitant</b></h2>

    <form class="form" action="http://localhost/PROJECT/inhabitant_added.php" method="post">

      <div>
        <label to="first-name">First name: </label>
        <input type="text" name="first-name" size="40" value=""/>
      </div>
      <div>
        <label to="last-name">Last name: </label>
        <input type="text" name="last-name" size="40" value=""/>
      </div>
      <div>
        <label to="age">Age: </label>
        <input type="text" name="age" size="40" value=""/>
      </div>
      <div>
        <label to="date-of-birth">Date of birth (YYYY-MM-DD): </label>
        <input type="text" name="date-of-birth" size="40" value=""/>
      </div>
      <div>
        <label to="date-of-death">Date of death (YYYY-MM-DD): </label>
        <input type="text" name="date-of-death" size="40" value=""/>
      </div>
      <div>
        <label to="life-sentence">Life sentence: </label>
        <input type="text" name="life-sentence" size="40" value=""/>
      </div>


        <input type="submit" name="submit" value="Send"/>

        <a href="http://localhost/PROJECT/get_inhabitant.php">
          <button class="centered" type="button" name="list_inhabitant">See Inhabitant List</button>
        </a>
        
    </form>

  </body>
</html>
