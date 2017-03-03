<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Add Inhabitant</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>

    <?php
    if(isset($_POST['submit'])) {

      $data_missing = array();

      if(empty($_POST['first-name'])) {
        $data_missing[] = 'First Name';
      } else {
        $f_name = trim($_POST['first-name']);
      }
      if(empty($_POST['last-name'])) {
        $data_missing[] = 'Last Name';
      } else {
        $l_name = trim($_POST['last-name']);
      }
      if(empty($_POST['age'])) {
        $data_missing[] = 'Age';
      } else {
        $age = trim($_POST['age']);
      }
      if(empty($_POST['date-of-birth'])) {
        $data_missing[] = 'Date of Birth';
      } else {
        $d_birth = trim($_POST['date-of-birth']);
      }
      if(empty($_POST['date-of-death'])) {
        $data_missing[] = 'Date of Death';
      } else {
        $d_death = trim($_POST['date-of-death']);
      }
      if(empty($_POST['life-sentence'])) {
        $data_missing[] = 'Life Sentence';
      } else {
        $sentence = trim($_POST['life-sentence']);
      }

      if(empty($data_missing)) {
        require_once('mysqli_connect.php');

        $query = "INSERT INTO Inhabitants (FirstName,
                                           LastName,
                                           Age,
                                           DateOfBirth,
                                           DateOfDeath,
                                           LifeSentence)
                  VALUES (?, ?, ?, ?, ?, ?)";


        $stmt = mysqli_prepare($dbc, $query);



        mysqli_stmt_bind_param($stmt, "ssisss", $f_name,
                                                   $l_name,
                                                   $age,
                                                   $d_birth,
                                                   $d_death,
                                                   $sentence);

        mysqli_stmt_execute($stmt);

        mysqli_commit($dbc);

        $affected_rows = mysqli_stmt_affected_rows($stmt);

        if($affected_rows == 1) {
          echo 'Inhabitant entered';
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

     <form action="http://localhost/PROJECT/inhabitant_added.php" method="post">
       <b>Update a new inhabitant</b>

       <div>
         <span>First name: </span>
         <input type="text" name="first-name" size="40" value=""/>
       </div>
       <div>
         <span>Last name: </span>
         <input type="text" name="last-name" size="40" value=""/>
       </div>
       <div>
         <span>Age: </span>
         <input type="text" name="age" size="40" value=""/>
       </div>
       <div>
         <span>Date of birth (YYYY-MM-DD): </span>
         <input type="text" name="date-of-birth" size="40" value=""/>
       </div>
       <div>
         <span>Date of death (YYYY-MM-DD): </span>
         <input type="text" name="date-of-death" size="40" value=""/>
       </div>
       <div>
         <span>Life sentence: </span>
         <input type="text" name="life-sentence" size="40" value=""/>
       </div>

       <div>
         <input type="submit" name="submit" value="Send"/>
       </div>

     </form>


  </body>
</html>
