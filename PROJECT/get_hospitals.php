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

    $query = 'SELECT H.HospitalID,
                     H.HospitalName,
                     P.Street Street,
                     P.Number Number
              FROM Hospitals AS H
              INNER JOIN Places AS P
              ON H.PlaceID = P.PlaceID';

    $response = @mysqli_query($dbc, $query);

    if ($response) {
      echo '<table class="table" align="left"
      cellspacing="5" cellpadding="10">
      <tr class="headings">
      <td align="left"><b>ID</b></td>
      <td align="left"><b>Hospital Name</b></td>
      <td align="left"><b>Street</b></td>
      <td align="left"><b>Number</b></td>
      <tr>
      ';


      while ($row = mysqli_fetch_array($response)) {


        echo '<tr>
        <td align="left">' . $row['HospitalID'] . '</td>
        <td align="left">' . $row['HospitalName'] . '</td>
        <td align="left">' . $row['Street'] . '</td>
        <td align="left">' . $row['Number'] . '</td>
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
