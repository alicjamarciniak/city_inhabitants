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

    $query = 'SELECT * FROM Society';

    $response = @mysqli_query($dbc, $query);

    if ($response) {
      echo '<table class="table" align="left"
      cellspacing="5" cellpadding="10">
      <tr class="headings">
      <td align="left"><b>Population</b></td>
      <td align="left"><b>In prework age</b></td>
      <td align="left"><b>In work age</b></td>
      <td align="left"><b>In postwork age</b></td>
      <td align="left"><b>Deaths</b></td>
      <td align="left"><b>Births</b></td>
      <td align="left"><b>Average age</b></td>
      <td align="left"><b>MIN age</b></td>
      <td align="left"><b>MAX age</b></td>
      <tr>
      ';


      while ($row = mysqli_fetch_array($response)) {


        echo '<tr>
        <td align="left">' . $row['Population'] . '</td>
        <td align="left">' . $row['PreWorkAge'] . '</td>
        <td align="left">' . $row['WorkAge'] . '</td>
        <td align="left">' . $row['PostWorkAge'] . '</td>
        <td align="left">' . $row['Deaths'] . '</td>
        <td align="left">' . $row['Births'] . '</td>
        <td align="left">' . $row['AverageAge'] . '</td>
        <td align="left">' . $row['MinAge'] . '</td>
        <td align="left">' . $row['MaxAge'] . '</td>
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
