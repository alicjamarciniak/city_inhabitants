<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Get Relationships</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>


    <?php

    require_once('mysqli_connect.php');

    $query = 'SELECT FamilyRelationID, Relation FROM FamilyRelations';


    $response = @mysqli_query($dbc, $query);

    if ($response) {
      echo '<table class="table" align="left"
      cellspacing="5" cellpadding="10">
      <tr class="headings">
      <td align="left"><b>ID</b></td>
      <td align="left"><b>Relation</b></td>
      <tr>
      ';


      while ($row = mysqli_fetch_array($response)) {


        echo '<tr>
        <td align="left">' . $row['FamilyRelationID'] . '</td>
        <td align="left">' . $row['Relation'] . '</td>';

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
