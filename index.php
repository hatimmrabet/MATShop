  <?php require_once("includes/BDD.php"); ?>

  <!DOCTYPE html>
  <html lang="fr">

  <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta http-equiv="x-ua-compatible" content="ie=edge">

      <title>MAT Shop</title>
      <link rel="icon" type="image/png" href="img/logos/logo.ico" />

      <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,800,600,300,300italic,700' rel='stylesheet' type='text/css'>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
      <link href="css/materialize.css" rel="stylesheet">
      <link href="css/magnific-popup.css" rel="stylesheet">
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/mdb.min.css" rel="stylesheet">
      <link href="css/responsive.css" rel="stylesheet">

      <link href="css/style.css" rel="stylesheet">
  </head>

  <body>
      <?php $accueil = 0;
        require_once("includes/header.php"); ?>

      <div id="home" class="slider">
          <ul class="slides">
              <?php
                $sql = "SELECT * from t_visuel_vis join t_categorie_cat using(cat_id) where vis_visibilite = 'L' and cat_intitule like 'couverture' order by vis_id desc limit 5"; //les 4 derniers photo enligne
                $res = $mysqli->query($sql);

                while ($vis = $res->fetch_assoc()) {
                ?>
                  <li>
                      <img src="img/visuels/<?php echo $vis['vis_nom_fichier'] ?>"> <!-- random image -->
                  </li>
              <?php } ?>
          </ul>
      </div> <!-- end of slider -->

      <section id="actualite" class="service">
          <div class="container">
              <div class="row">
                  <div class="col-sm-12">
                      <div class="card">
                          <div class="card-header">
                              Actualités :
                          </div>
                          <div class="card-body">
                              <!-- debut d'affichage des actualites  -->
                              <?php
                                $requet = "SELECT * from t_news_new where new_etat='L' order by new_date desc , new_num desc limit 3";
                                $result = $mysqli->query($requet);
                                if ($result == false) {
                                    echo "Error: La requête a echoué \n";
                                    echo "Errno: " . $mysqli->errno . "\n";
                                    echo "Error: " . $mysqli->error . "\n";
                                    exit();
                                } else //La requête s’est bien exécutée
                                {
                                    $row_cnt = $result->num_rows;
                                    while ($row = $result->fetch_assoc()) {
                                ?>
                                <!--    Balise d'actualites    -->
                                <blockquote class="blockquote border-bottom border border-dark">
                                    <h4><?php echo $row["new_titre"] ?></h4>
                                    <p><?php echo $row["new_texte"] ?></p>
                                    <footer class="blockquote-footer ">Publié par : <?php echo $row["cpt_pseudo"] ?></footer>
                                </blockquote>
                              <?php
                                    } //Fin boucle while
                                    $result->free();    /* Libération des résultats */
                                } //end if
                                ?>
                          </div>
                      </div>

                  </div>
              </div>
          </div>
      </section> <!-- End of actualites section -->


      <section id="produits" class="portfolio" style="margin-bottom: 3rem;">
          <div class="container">
              <div class="row">
                  <div class="main_portfolio_area">
                      <div class="head_title center wow fadeInUp">
                          <h2 style="margin-bottom: 0;">Tous nos Produits</h2>
                          <p></p>
                      </div>
                      <div class="main_portfolio_content center wow fadeInUp">
                          <div class="main_mix_menu">
                              <ul class="text-uppercase">
                                  <li class="filter" data-filter="all">All</li>
                                  <?php
                                    $requet = "SELECT distinct cat_id, cat_intitule from t_visuel_vis join t_categorie_cat using(cat_id)  where cat_intitule not like 'couverture' ";
                                    $result = $mysqli->query($requet);
                                    if ($result == false) {
                                        echo "Error: La requête a echoué \n";
                                        echo "Errno: " . $mysqli->errno . "\n";
                                        echo "Error: " . $mysqli->error . "\n";
                                        exit();
                                    } else //La requête s’est bien exécutée
                                    {
                                        $row_cnt = $result->num_rows;
                                        while ($row = $result->fetch_assoc()) {
                                    ?>
                                  <li class="filter" data-filter=".cat<?php echo $row['cat_id']; ?>"><?php echo $row['cat_intitule']; ?></li>
                                    <?php } } ?>
                              </ul>
                          </div>

                          <div id="mixcontent" class="mixcontent  wow zoomIn">
                          <?php
                            $requet = "SELECT *  from t_visuel_vis join t_categorie_cat using(cat_id) where cat_intitule not like 'couverture' ";
                            $result = $mysqli->query($requet);
                            if ($result == false) {
                                echo "Error: La requête a echoué \n";
                                echo "Errno: " . $mysqli->errno . "\n";
                                echo "Error: " . $mysqli->error . "\n";
                                exit();
                            } else //La requête s’est bien exécutée
                            {
                                $row_cnt = $result->num_rows;
                                while ($row = $result->fetch_assoc()) {
                            ?>
                            <div class="col-md-4 mix cat<?php echo $row['cat_id']; ?>" style="margin-bottom: 15px;">
                                  <div class="single_mixi_portfolio">
                                      <div class="single_portfolio_img">
                                          <img src="img/visuels/<?php echo $row['vis_nom_fichier']; ?>" alt="" />
                                          <div class="mixi_portfolio_overlay">
                                              <a href="img/visuels/<?php echo $row['vis_nom_fichier']; ?>" class="gallery-img"><i class="fa fa-search-plus"></i></a>
                                          </div>
                                      </div>
                                  </div>
                              </div>

                              <?php } } ?>
                              
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </section><!-- End of produits Section -->

      <section id="footer" class="footer">
          <div class="container ">
              <div class="row main_footer_area white-text p-b-1 p-t-1 col-md-3 " style="margin-left: 38%;">
                  <div class="single_f_widget wow fadeInUp">
                      <img src="img/logos/logo_100.png" alt="">
                  </div>
              </div>
          </div>
      </section>

      <!-- SCRIPTS -->
      <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
      <script type="text/javascript" src="js/tether.min.js"></script>
      <script type="text/javascript" src="js/bootstrap.min.js"></script>
      <script type="text/javascript" src="js/mdb.min.js"></script>
      <script type="text/javascript" src="js/wow.min.js"></script>
      <script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
      <script type="text/javascript" src="js/jquery.magnific-popup.js"></script>
      <script type="text/javascript" src="js/accordion.js"></script>
      <script type="text/javascript" src="js/materialize.js"></script>
      <script>
          $(".button-collapse").sideNav();
      </script>
      <script type="text/javascript">
          new WOW().init();
      </script>
      <script type="text/javascript" src="js/plugins.js"></script>
      <script type="text/javascript" src="js/main.js"></script>
  </body>

  <?php $mysqli->close();  //Ferme la connexion avec la base MariaDB 
    ?>

  </html>