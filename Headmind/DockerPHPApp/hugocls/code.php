<?php
function computeRandomCode(): string{
    srand(seed: $_GET['seed']);
    $code = rand();
    return substr(string: $code,offset: 0, length: 8);
}
echo computeRandomCode();
?>
