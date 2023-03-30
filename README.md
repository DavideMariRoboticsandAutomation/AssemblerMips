Questo è un semplice script riguardante il linguaggio Assembler Mips runnato con il software QTSPIM realizzato durante il periodo universitario.

//////////////////////////////////////////////////////////////////////////////////////////////////////////
Per chi non conoscesse il software QTSPIM : QTSpim è un software che permette agli sviluppatori di scrivere, testare e debuggare programmi scritti in linguaggio assembly MIPS. Il software emula l'architettura MIPS, fornendo agli sviluppatori un ambiente virtuale per eseguire e testare il loro codice senza la necessità di hardware fisico MIPS. QTSpim è utilizzato principalmente per l'insegnamento e la ricerca nell'ambito dei sistemi operativi e dell'architettura dei calcolatori.

//////////////////////////////////////////////////////////////////////////////////////////////////////////

Il codice fornito è una implementazione in linguaggio assembly MIPS di un algoritmo di ordinamento crescente di un vettore di interi, basato sull'algoritmo di ordinamento a bolle (bubble sort). La procedura "sort" prende due argomenti in input, il primo è l'indirizzo del primo elemento del vettore e il secondo è il numero di elementi nel vettore. La procedura usa la procedura "swap" per scambiare gli elementi del vettore e utilizza i registri $s0-$s3 e $t0-$t4 per le operazioni di ordinamento. Il codice esegue due cicli annidati per confrontare tutti gli elementi del vettore e scambiarli se necessario. Alla fine del codice, i registri salvati nello stack vengono ripristinati.
