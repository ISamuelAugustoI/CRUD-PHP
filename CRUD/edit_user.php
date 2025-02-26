<?php
session_start();
require 'conection.php';
?>
<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Crud | PHP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                    <h4>Editar Usuários
                    <a href="index.php" class="btn btn-primary float-end">Voltar</a>
                    </h4>
                    </div>
                    <div class="card-body">
                        <?php
                        if(isset($_GET['id'])){
                            $usuario_id = mysqli_real_escape_string($conection,$_GET['id']);
                            $sql = "SELECT * FROM tbusuarios WHERE id='$usuario_id'";
                            $query = mysqli_query($conection,$sql);
                            if(mysqli_num_rows($query)>0){
                                $usuario = mysqli_fetch_array($query);
                        ?>
                        <form action="commands.php" method="POST">
                            <input type="hidden" name="usuario_id" value="<?=$usuario['id']?>">
                            <div class="mb-3">
                                <label for="nome">Nome</label>
                                <input type="text" value="<?=$usuario['nome']?>" name="nome" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="email">Email</label>
                                <input type="text" value="<?=$usuario['email']?>" name="email" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="data_nascimento">Data Nascimento</label>
                                <input type="date" value="<?=$usuario['data_nascimento']?>" name="data_nascimento" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="senha">Senha</label>
                                <input type="password" name="senha" class="form-control">
                            </div>
                            <div class="mb-3">
                                <button type="submit" name="update" class="btn btn-primary">Salvar</button>
                            </div>
                        </form>
                        <?php
                        }
                        else{
                            echo '<h5>Usuário não encontrado</h5>';
                        }
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>