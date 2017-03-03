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

    $query = 'SELECT I1.FirstName FName1,
                     I1.LastName LName1,
                     R.Relation Relationship,
                     I2.FirstName FName2,
                     I2.LastName LName2,
                     M.FamilyName
              FROM Inhabitants AS I1
              INNER JOIN FamilyMembers AS M
              ON I1.InhabitantID = M.Inhabitant1ID
              INNER JOIN FamilyRelations AS R
              ON M.FamilyRelationID = R.FamilyRelationID
              INNER JOIN Inhabitants AS I2
              ON I2.InhabitantID = M.Inhabitant2ID
              ORDER BY I1.LastName ASC, I1.FirstName';

    $response = @mysqli_query($dbc, $query);

    if ($response) {
      echo '<table class="table" align="left"
      cellspacing="5" cellpadding="10">
      <tr class="headings">
      <td align="left"><b>Inhabitant 1 first name</b></td>
      <td align="left"><b>Inhabitant 1 last name</b></td>
      <td align="left"><b>Relationship type</b></td>
      <td align="left"><b>Inhabitant 2 first name</b></td>
      <td align="left"><b>Inhabitant 2 last name</b></td>
      <td align="left"><b>Family Name</b></td>
      <tr>
      ';


      while ($row = mysqli_fetch_array($response)) {


        echo '<tr>
        <td align="left">' . $row['FName1'] . '</td>
        <td align="left">' . $row['LName1'] . '</td>
        <td align="left">' . $row['Relationship'] . '</td>
        <td align="left">' . $row['FName1'] . '</td>
        <td align="left">' . $row['LName1'] . '</td>
        <td align="left">' . $row['FamilyName'] . '</td>';
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
