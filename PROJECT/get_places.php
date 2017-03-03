<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Get Places</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>


    <?php

    require_once('mysqli_connect.php');

    $query = 'SELECT P.PlaceID,
                     P.Name,
                     P.Street,
                     P.Number,
                     P.Flat,
                     C.Name Category
              FROM Places AS P
              INNER JOIN PlacesCategories AS C
              ON P.PlaceCategoryID = C.PlaceCategoryID;
              ';

    $response = @mysqli_query($dbc, $query);

    if ($response) {
      echo '<table class="table" align="left"
      cellspacing="5" cellpadding="10">
      <tr class="headings">
      <td align="left"><b>ID</b></td>
      <td align="left"><b>Name</b></td>
      <td align="left"><b>Street</b></td>
      <td align="left"><b>Number</b></td>
      <td align="left"><b>Flat</b></td>
      <td align="left"><b>Category</b></td>
      <tr>
      ';


      while ($row = mysqli_fetch_array($response)) {


        echo '<tr>
        <td align="left">' . $row['PlaceID'] . '</td>
        <td align="left">' . $row['Name'] . '</td>
        <td align="left">' . $row['Street'] . '</td>
        <td align="left">' . $row['Number'] . '</td>
        <td align="left">' . $row['Flat'] . '</td>
        <td align="left">' . $row['Category'] . '</td>';

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
