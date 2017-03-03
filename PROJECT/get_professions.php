<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Get Inhabitats</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>


    <?php

    require_once('mysqli_connect.php');

    $query = 'SELECT PR.ProffesionID,
                     PR.Name,
                     PL.Name WorkPlace
              FROM Professions AS PR
              INNER JOIN Places AS PL
              ON PR.WorkPlaceID = PL.PlaceID';

    $response = @mysqli_query($dbc, $query);

    if ($response) {
      echo '<table class="table" align="left"
      cellspacing="5" cellpadding="10">
      <tr class="headings">
      <td align="left"><b>ID</b></td>
      <td align="left"><b>Name</b></td>
      <td align="left"><b>Workplace</b></td>
      <tr>
      ';


      while ($row = mysqli_fetch_array($response)) {


        echo '<tr>
        <td align="left">' . $row['ProffesionID'] . '</td>
        <td align="left">' . $row['Name'] . '</td>
        <td align="left">' . $row['WorkPlace'] . '</td>
        ';

        echo '</tr>';
      }
      echo '</table>';

    } else {

      echo 'Could not issue database query';
      echo mysqli_error($dbc);

    }

    mysqli_close($dbc);

     ?>

  </body>
</html>
