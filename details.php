<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<?php
  ini_set('error_reporting', E_ALL);
  ini_set('display_errors', 1);
  require_once "db.php";
  if (isset($_GET['id'])) {
    $ID = $_GET['id'];
    //$query = "SELECT * FROM Complaints JOIN Users ON Complaints.userID = Users.userID WHERE Complaints.complaintID = ".$id;
    // $query = "SELECT * FROM Complaints c, MakesComplaint m, Users u WHERE "."c.complaintID = m.complaintID AND m.userID = u.userID AND m.ComplaintID =".$complaintID;
    // $query = mysqli_query($conn, $query);
    // if (!$query) {
    //   die ('SQL Error: ' . mysqli_error($conn));
    // }
  }
?>
<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <title>Discover Movies</title>
</head>
<body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index.php">Movie Database</a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="index.php">Home</a></li>
        <li class="active">
          <a href="movie.php">Movies</a>
        </li>
        <li><a href="people.php">People</a></li>
        <li><a href="to_watch.php">To Watch</a></li>
      </ul>
    </div>
  </nav>
<div class = 'result'>
  <table class="table table-striped table-bordered table-condensed">
		    <tbody>
          <?php
            $query = "SELECT * from movie where movie_id='$ID'";
            $result_movie = mysqli_fetch_assoc(mysqli_query($conn, $query));
            $query = "select * from cast_info c, person p where c.movie_id='$ID' and c.person_id = p.person_id";
            $result = mysqli_query($conn, $query);
            $cast = "";
            while($row = mysqli_fetch_assoc($result)) {
                $cast .= '<a href = "people.php?id='.$row['person_id'].'">'.$row['name']."</a>(".$row['char_name']."-".$row['role']."), \n\n";
            }
            echo '<tr>
                <td>Name</td><td>'.$result_movie['title'].'</td>
              </tr>
              <tr>
                  <td>IMBD Rating</td><td>'.$result_movie['rating'].'</td>
              </tr>
              <tr>
                  <td>Cast</td><td>'.$cast.'</td>
              </tr>
              <tr>
                  <td>Year of Release</td><td>'.$result_movie['year'].'</td>
              </tr>
              <tr>
                  <td>Production House</td><td>'.$result_movie['title'].'</td>
              </tr>
              <tr>
                  <td>Plot</td><td>'.$result_movie['plot'].'</td>
              </tr>
              ';
        		?>
        </tbody>
    </table>
  </div>
</body>
</html>

<style>

.result {
  padding: 1%;
}

.search {
  padding: 1%;
}

/* --------------- */

</style>
