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

    $query = 'SELECT IH.FirstName,
                     IH.LastName,
                     IL.Name Illness
              FROM Inhabitants AS IH
              LEFT JOIN __InhabitantID_IlnessID AS __IN_IL
              ON IH.InhabitantID = __IN_IL.InhabitantID
              LEFT JOIN Ilnesses AS IL
              ON __IN_IL.IlnessID = IL.IlnessID'
;

    $response = @mysqli_query($dbc, $query);

    if ($response) {
      echo '<table class="table" align="left"
      cellspacing="5" cellpadding="10">
      <tr class="headings">
      <td align="left"><b>First name</b></td>
      <td align="left"><b>Last name</b></td>
      <td align="left"><b>Illness</b></td>
      <tr>
      ';


      while ($row = mysqli_fetch_array($response)) {


        echo '<tr>
        <td align="left">' . $row['FirstName'] . '</td>
        <td align="left">' . $row['LastName'] . '</td>
        <td align="left">' . $row['Illness'] . '</td>';

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
