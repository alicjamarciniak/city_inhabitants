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

    $query = 'SELECT D.DoctorID,
                     I.FirstName FirstName,
                     I.LastName LastName,
                     D.Secialization,
                     H.HospitalName Hospital
              FROM Inhabitants AS I
              INNER JOIN Doctors AS D
              ON D.InhabitantID = I.InhabitantID
              INNER JOIN Hospitals AS H
              ON D.HospitalID = H.HospitalID';


    $response = @mysqli_query($dbc, $query);

    if ($response) {
      echo '<table class="table" align="left"
      cellspacing="5" cellpadding="10">
      <tr class="headings">
      <td align="left"><b>ID</b></td>
      <td align="left"><b>First name</b></td>
      <td align="left"><b>Last name</b></td>
      <td align="left"><b>Specialization</b></td>
      <td align="left"><b>Hospital Name</b></td>
      <tr>
      ';


      while ($row = mysqli_fetch_array($response)) {


        echo '<tr>
        <td align="left">' . $row['DoctorID'] . '</td>
        <td align="left">' . $row['FirstName'] . '</td>
        <td align="left">' . $row['LastName'] . '</td>
        <td align="left">' . $row['Secialization'] . '</td>
        <td align="left">' . $row['Hospital'] . '</td>';
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
