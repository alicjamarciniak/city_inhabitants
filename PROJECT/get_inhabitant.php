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

    $query = 'SELECT InhabitantID,
                     FirstName,
                     LastName,
                     Age,
                     DateOfBirth,
                     DateOfDeath,
                     LifeSentence
              FROM Inhabitants';

    $response = @mysqli_query($dbc, $query);

    if ($response) {
      echo '<table class="table" align="left"
      cellspacing="5" cellpadding="10">
      <tr class="headings">
      <td align="left"><b>ID</b></td>
      <td align="left"><b>First name</b></td>
      <td align="left"><b>Last name</b></td>
      <td align="left"><b>Age</b></td>
      <td align="left"><b>Date of birth</b></td>
      <td align="left"><b>Date of death</b></td>
      <td align="left"><b>Life Sentence</b></td>
      <tr>
      ';


      while ($row = mysqli_fetch_array($response)) {


        echo '<tr>
        <td align="left">' . $row['InhabitantID'] . '</td>
        <td align="left">' . $row['FirstName'] . '</td>
        <td align="left">' . $row['LastName'] . '</td>
        <td align="left">' . $row['Age'] . '</td>
        <td align="left">' . $row['DateOfBirth'] . '</td>
        <td align="left">' . $row['DateOfDeath'] . '</td>
        <td align="left">' . $row['LifeSentence'] . '</td>';

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
