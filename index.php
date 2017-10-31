<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<?php
  ini_set('error_reporting', E_ALL);
  ini_set('display_errors', 1);
  require_once "db.php";
  if(isset($_POST['Submit'])) {
    $search = $_POST['Search'];
    $query = "SELECT * from movie where title like '%$search%'";
    //echo $query;
    $query = mysqli_query($conn, $query);
  }
?>
<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Movie Database</title>
</head>
<body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index.php">Movie Database</a>
      </div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.php">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Discover
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="movie.php">Movies</a></li>
            <li><a href="tvshow.php">TV Shows</a></li>
          </ul>
        </li>
        <li><a href="people.php">People</a></li>
        <li><a href="to_watch.php">To Watch</a></li>
      </ul>
    </div>
  </nav>
<div class = "search" id="search">
  <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
    <div class = "form-group">
          <label>Search</label>
          <input type"text" id="search" name="Search" required>
          <input type="submit" name="Submit" value="Submit" class="btn btn-default">
    </div>
  </form>
</div>
<div class = 'result'>
  <table class="table table-striped table-bordered table-condensed">
    <?php
      if(isset($_POST['Submit'])) {
        echo '<thead>
          <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Year</th>
            <th>Plot</th>
            <th>Rating</th>
          </tr>
        </thead>
		    <tbody>';

            $i=1;
        		while ($row = mysqli_fetch_array($query)) {
              echo '<tr>
        					<td>'.$i.'</td>
        					<td><a href = "details.php?id='.$row['movie_id'].'">'.$row['title'].'</a></td>
                  <td>'.$row['year'].'</td>
                  <td>'.$row['plot'].'</td>
                  <td>'.$row['rating'].'</td>
        				</tr>';
                $i++;
        		}
          }?>
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
