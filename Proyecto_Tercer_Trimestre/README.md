###Las **Primary Keys** van en negrita, las ***Foreign keys*** van en negrita y cursiva.

| personaje | | 
|------|------|
| **codpersonaje** | varchar2 (3) |
| nombre | varchar2 (15) |
| altura | number (3,2) |
| peso | number (3) |
| raza | varchar2 (10) |


| armas | |
| ----- | -----| 
| **codarma** | varchar2 (3) | Primary Key
| nombre | varchar2 (15) |
| fuerza |  number (2) |
| destreza | number (2)|
| inteligencia | number (2) |
| rareza | varchar2 (10) |
| nivel | number (2) |


| equipar | |
| ----- | -----| 
| ***codpersonaje*** | varchar2 (3) |
| ***codarma*** | varchar2 (3) |
| **fecha** | date |


| mapa | |
| ----- | -----| 
| **codmapa** | varchar2 (3) |
| nombre | varchar2 (3) |
| habitat | varchar2 (20) |
| clima | varchar2 (10) |


| Tesoros | |
|----- | -----| 
| **codtesoro** | varchar 2 (3) |
| ***codmapa*** | varchar2 (3) |
| nombre | varchar2 (3) |
| antiguedad | date |
| rareza | varchar2 (10)|


