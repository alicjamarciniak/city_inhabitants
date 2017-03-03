<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Add Inhabitant</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>

    <h2 style="text-align: center"><b>Remove inhabitant by index</b></h2>

    <form class="form" action="http://localhost/PROJECT/inabitant_removed.php" method="post">

      <div>
        <label to="index">Inhabitant's index: </label>
        <input type="text" name="index" size="40" value=""/>
      </div>

        <input type="submit" name="submit" value="Send"/>
    </form>

    <a href="http://localhost/PROJECT/get_inhabitant.php">
      <button class="centered" type="button" name="list_inhabitant">See Inhabitant List</button>
    </a>

  </body>
</html>
