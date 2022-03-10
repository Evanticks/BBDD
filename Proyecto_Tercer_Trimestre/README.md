| personaje | | 
|:------:|:------:|
| codpersonaje | varchar2 (3) | Primay Key |
| nombre | varchar2 (15) |
| altura | number (3,2) |
| peso | number (3) |
| raza | varchar2 (10) |

| armas | |
| ----- | -----| 
| codarma | varchar2 (3) | Primary Key
| nombre | varchar2 (15) |
| fuerza |  number (2) |
| destreza | number (2)|
| inteligencia | number (2) |
| rareza | varchar2 (10) |
| nivel | number (2) |

| equipar | |
| ----- | -----| 
| codpersonaje | varchar2 (3) |
| codarma | varchar2 (3) |
|fecha | date |