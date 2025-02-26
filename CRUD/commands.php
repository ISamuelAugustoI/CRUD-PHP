<?php
session_start();
require 'conection.php';

if(isset($_POST['create'])){
    $nome = mysqli_real_escape_string($conection,trim($_POST['nome']));
    $email = mysqli_real_escape_string($conection,trim($_POST['email']));
    $data_nascimento = mysqli_real_escape_string($conection,trim($_POST['data_nascimento']));
    $senha = isset($_POST['senha']) ? mysqli_real_escape_string($conection,password_hash(trim($_POST['senha']), PASSWORD_DEFAULT)) : '';
    $sql = "INSERT INTO tbusuarios(nome,email,data_nascimento,senha) VALUES ('$nome','$email','$data_nascimento','$senha')";
    mysqli_query($conection,$sql);
    if(mysqli_query($conection, $sql)){
        $_SESSION['message'] = 'Usuário criado com sucesso!';
    } else {
        $_SESSION['message'] = 'Erro ao criar usuário: ' . mysqli_error($conection);
    }
    header('Location: index.php');
    exit;
}
if(isset($_POST['update'])){
    $usuario_id = mysqli_real_escape_string($conection,$_POST['usuario_id']);
    $nome = mysqli_real_escape_string($conection,trim($_POST['nome']));
    $email = mysqli_real_escape_string($conection,trim($_POST['email']));
    $data_nascimento = mysqli_real_escape_string($conection,trim($_POST['data_nascimento']));
    $senha = mysqli_real_escape_string($conection,trim($_POST['senha']));
    $sql = "UPDATE tbusuarios SET nome = '$nome', email = '$email', data_nascimento = '$data_nascimento'";
    if(!empty($senha)){
        $sql .= ", senha ='" . password_hash($senha, PASSWORD_DEFAULT) . "'"; 
    }
    $sql .= " WHERE id = '$usuario_id'";
    mysqli_query($conection,$sql);
    if(mysqli_query($conection, $sql)){
        $_SESSION['message'] = 'Usuário atualizado com sucesso!';
    } else {
        $_SESSION['message'] = 'Erro ao atualizar usuário: ' . mysqli_error($conection);
    }
    header('Location: index.php');
    exit;
}
if(isset($_POST['delete'])){
    $usuario_id = mysqli_real_escape_string($conection,$_POST['delete']);
    $sql = "DELETE FROM tbusuarios WHERE id='$usuario_id'";
    mysqli_query($conection,$sql);
    if(mysqli_query($conection, $sql)){
        $_SESSION['message'] = 'Usuário deletado com sucesso!';
    } else {
        $_SESSION['message'] = 'Erro ao deletar usuário: ' . mysqli_error($conection);
    }
    header('Location: index.php');
    exit;
}
?>