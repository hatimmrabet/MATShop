<nav class="navbar navbar-expand navbar-light bg-light static-top" style="width: 100%;">
    <div class="collapse navbar-collapse" id="navbarNav" >
    <a class="navbar-brand" href="../index.php" style="width:10%"><img src="../img/logos/logo_navbar.png" style="width:80%;"></a>
        <ul class="navbar-nav ml-auto" style="margin-right:5%;">
            <li class="nav-item <?php if($accueil==0) echo 'active' ;?>">
                <a class="nav-link" href="../index.php">Accueil</a>
            </li>
            <li class="nav-item <?php if($accueil==3) echo 'active' ;?>">
                <a class="nav-link" href="../display/affichagecategorie.php?indice=0">Catégorie</a>
            </li>
            <li class="nav-item <?php if($accueil==2) echo 'active' ;?>">
                <a class="nav-link" href="../login/inscription.php">Sign up</a>
            </li>
            <li class="nav-item <?php if($accueil==1) echo 'active' ;?>">
                <a class="nav-link" href="../login/session.php">login<img src="../img/login.png " style="width: 15px;margin-left: 8px;"></a>
            </li>
        </ul>
    </div>
</nav>
