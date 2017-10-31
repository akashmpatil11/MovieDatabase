<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<?php
  ini_set('error_reporting', E_ALL);
  ini_set('display_errors', 1);
  require_once "db.php";
  if(isset($_POST['Submit'])) {
    //$keyword = $_POST['keyword'];
    //$genre = $_POST['genre'];
    //$year = $_POST['year'];
    if(isset($_POST['sort']))
      $sort = $_POST['sort'];
    $sort = 'rating';  //Initialization if no choice is given
    if($sort == 'name_asc')
      $str = " ORDER BY title";
    if($sort =='name_desc')
      $str = " ORDER BY title DESC";
    if($sort =='year_asc')
      $str = " ORDER BY year";
    if($sort =='year_desc')
      $str = " ORDER BY year DESC";
    if($sort =='rating')
      $str = " ORDER BY rating DESC";


    if($_POST['keyword'] != "") {
      //$sql = "SELECT title from movie inner join keyword on 'movie.movie_id' = 'keyword.movie_id' where 'keyword.keyword' =".$keyword;
      if(isset($_POST['genre'])) {
        if($_POST['year'] != ""){
          //$sql = "SELECT * FROM movie INNER JOIN keyword ON 'movie.movie_id' = 'keyword.movie_id' INNER JOIN 'movie_genre' ON 'movie_genre.movie_id' = 'movie.movie_id' INNER JOIN 'genre' ON 'movie_genre.genre_id' = '$genre' WHERE 'keyword.keyword' = '$keyword' AND 'movie.year' = '$year'";
          $keyword = $_POST['keyword'];
          $genre = $_POST['genre'];
          $year = $_POST['year'];
          $sql = "SELECT * FROM movie NATURAL JOIN genre NATURAL JOIN movie_genre NATURAL JOIN keyword WHERE genre_type = '$genre' AND keyword = '$keyword' AND year = '$year' AND kind = 'tv'".$str;
        }
        else {
          $keyword = $_POST['keyword'];
          $genre = $_POST['genre'];
          $sql = "SELECT * FROM movie NATURAL JOIN genre NATURAL JOIN movie_genre NATURAL JOIN keyword WHERE genre_type = '$genre' AND keyword = '$keyword' AND kind = 'tv'".$str;
        }
      }
      else {
        if($_POST['year'] != ""){
          $keyword = $_POST['keyword'];
          $year = $_POST['year'];
          $sql = "SELECT * FROM movie NATURAL JOIN keyword WHERE keyword = '$keyword' AND year = '$year' AND kind = 'tv'".$str;
          //$sql = "SELECT * FROM movie inner join keyword on 'movie.movie_id' = 'keyword.movie_id' where 'keyword.keyword' = '$keyword' AND 'movie.year' = '$year'";
        }
        else {
          $keyword = $_POST['keyword'];
          $sql = "SELECT * FROM movie natural join keyword where keyword = '$keyword' AND kind = 'tv'".$str;

        }
      }
    }
    else {
      //$sql = "SELECT title from movie inner join keyword on 'movie.movie_id' = 'keyword.movie_id' where 'keyword.keyword' =".$keyword;
      if(isset($_POST['genre'])) {
        if($_POST['year'] != ""){
          $genre = $_POST['genre'];
          $year = $_POST['year'];
          $sql = "SELECT * FROM movie NATURAL JOIN genre NATURAL JOIN movie_genre WHERE genre_type = '$genre' AND year = '$year' AND kind = 'tv'".$str;
        }
        else {
          $genre = $_POST['genre'];
          $sql = "SELECT * FROM movie NATURAL JOIN genre NATURAL JOIN movie_genre WHERE genre_type = '$genre' AND kind = 'tv'".$str;
        }
      }
      else {
        if($_POST['year'] != ""){
          $year = $_POST['year'];
          $sql = "SELECT * FROM movie WHERE year = '$year' AND kind = 'tv'".$str;
        }
        else {
            //NO OPTION GIVEN
          $sql = "SELECT * FROM movie WHERE kind = 'tv'".$str;
        }
      }
    }
    //echo $sql;
    //  $sql = "SELECT * from movie";
      //echo $sql;
      $query = mysqli_query($conn, $sql);
      //echo $status_row.$sql;die;
      //$status = mysqli_fetch_assoc($status_row);
      //echo $status['title'];
  }
?>
<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <title>Discover TV Shows</title>
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
          <a href="movie.php">TV Shows</a>
        </li>
        <li><a href="people.php">People</a></li>
        <li><a href="to_watch.php">To Watch</a></li>
      </ul>
    </div>
  </nav>
<h3>Discover TV Shows</h3>
  <form class= "search "class = "form-horizontal" method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
    <div class = "form-group">
        <label class = "control-label">Keyword</label>
        <input type"text" id="keyword" name="keyword">
    </div>
    <div class = "form-group">
        <label class = "control-label">Genre</label>
          <input type="checkbox" name="genre" value="Drama">Drama</input>
          <input type="checkbox" name="genre" value="Fantasy">Fantasy</input>
          <input type="checkbox" name="genre" value="Comedy">Comedy</input>
          <input type="checkbox" name="genre" value="Action">Action</input>
          <input type="checkbox" name="genre" value="Romance">Romance</input>
          <input type="checkbox" name="genre" value="Adventure">Adventure</input>
    </div>
    <div class = "form-group">
        <label class = "control-label">Year</label>
        <input type="text" id="year" name="year">
    </div>
    <div class = "form-group">
        <label class = "control-label">Sort by:</label>
          <input type="radio" name="sort" value="name_asc">Name &uarr;</input>
          <input type="radio" name="sort" value="name_desc">Name &darr;</input>
          <input type="radio" name="sort" value="year_asc">Year &uarr;</input>
          <input type="radio" name="sort" value="year_desc">Year &darr;</input>
          <input type="radio" name="sort" value="rating">Rating &darr;</input>
    </div>
    <div class = "form-group">
        <input type="submit" name='Submit' value="Submit">
    </div>
  </form>
<div class = 'result'>
  <table class="table table-striped table-bordered table-condensed">
        <thead>
          <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Year</th>
            <th>Plot</th>
            <th>Rating</th>
          </tr>
        </thead>
		    <tbody>
          <?php
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
