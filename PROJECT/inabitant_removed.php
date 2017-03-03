<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Remove inhabitant by index</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>

    <?php
    if(isset($_POST['submit'])) {

      $data_missing = array();

      $id = (int)$_POST['index'];

      if(empty($data_missing)) {
        require_once('mysqli_connect.php');

        $query = "DELETE FROM Inhabitants WHERE InhabitantID = ?";

        $stmt = mysqli_prepare($dbc, $query);

        mysqli_stmt_bind_param($stmt, "i", $id);

        mysqli_stmt_execute($stmt);

        $affected_rows = mysqli_stmt_affected_rows($stmt);

        if($affected_rows == 1) {
          echo 'Inhabitant removed';
          mysqli_stmt_close($stmt);
          mysqli_close($dbc);
        } else {
          echo 'Error occurred <br/>';
          echo mysqli_error();
          mysqli_stmt_close($stmt);
          mysqli_close($dbc);
        }
      } else {
        echo 'You need to enter the following data</br/>';

        foreach ($data_missing as $missing) {
          echo "$missing <br/>";
        }
      }
    }

     ?>


         <h2 style="text-align: center"><b>Remove inhabitant by index</b></h2>

         <form class="form" action="http://localhost/PROJECT/inabitant_removed.php" method="post">

           <div>
             <label to="index">Inhabitant's index: </label>
             <input type="text" name="indexe" size="40" value=""/>
           </div>

             <input type="submit" name="submit" value="Send"/>
         </form>

         <a href="http://localhost/PROJECT/get_inhabitant.php">
           <button class="centered" type="button" name="list_inhabitant">See Inhabitant List</button>
         </a>


  </body>
</html>
