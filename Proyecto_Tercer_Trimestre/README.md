###Las **Primary Keys** van en negrita, las ***Foreign keys*** van en negrita y cursiva.

| personaje | | |
| ----- | -----| ----- |
| **codpersonaje** | varchar2 (9) | que empiece por 1
| nombre | varchar2 (15) | Que empiece por mayúsculas y no lleve números. |
| altura | number (3,2) |
| peso | number (3) |
| raza | varchar2 (10) | "Humano" por defecto


| armas | | |
| ----- | -----| ----- |
| **codarma** | varchar2 (3) |
| nombre | varchar2 (15) | Único.
| fuerza |  number (2) |
| destreza | number (2)|
| inteligencia | number (2) |
| rareza | varchar2 (1) | que sea 'D','C','B','A','S'
| nivel | number (2) |

| mapa | | |
| ----- | -----| ----- |
| **codmapa** | varchar2 (3) | que empiece por 0 seguido de -
| ***codtesoro*** | varchar 2 (3) |
| nombre | varchar2 (20) | Not null.
| habitat | varchar2 (20) | 
| clima | varchar2 (10) | 'Lluvioso','Soleado','Nublado'
| temperatura | number (2) |


| Tesoros | | |
| ----- | -----| ----- |
| **codtesoro** | varchar 2 (3) |
| nombre | varchar2 (3) |
| antiguedad | date | No más de 2000, mostrar solo el año.
| rareza | varchar2 (10)|

| equipar | |
| ----- | -----|
| ***codpersonaje*** | varchar2 (9) |
| ***codarma*** | varchar2 (3) |
| **fecha** | date |

| ubicación | | |
| ----- | -----| ----- |
| ***codpersonaje*** | varchar2 (3) |
| ***codmapa*** | varchar2 (3) |
|**fecha** | date | Que la fecha esté entre 2000-2022

<span style="text-decoration:underline">codpersonaje</span>