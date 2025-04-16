# 📘 Sistem de Management Bancar - Proiect Baze de Date

Acest proiect reprezintă un sistem de gestiune a unei bănci, proiectat în SQL. Scopul său este de a modela și automatiza operațiunile financiare de bază (tranzacții, conturi, credite, carduri, depozite, angajați) într-o manieră relațională, respectând principiile normalizării și integrității datelor.

## 🧾 Descriere

Sistemul oferă suport pentru:
- Gestiunea clienților și conturilor bancare
- Înregistrarea și urmărirea tranzacțiilor financiare
- Administrarea creditelor și depozitelor
- Emiterea și monitorizarea cardurilor bancare
- Organizarea sucursalelor și a personalului
- Operații avansate LDD & LMD
- Interogări SQL complexe pentru raportare și analiză

## 🧩 Structura Bazei de Date

Baza de date include următoarele tabele principale:
- `Sucursala`
- `Clienti`
- `Conturi`
- `Tipuri_Conturi`
- `Angajati`
- `Tranzactii`
- `Credite`
- `Depozite`
- `Carduri`

Fiecare tabel include relații clare prin chei străine și constrângeri de integritate.

## 🧱 Fișiere Importante

- `scriptBD proiect.txt`: conține toate comenzile SQL necesare pentru:
  - Crearea tabelelor
  - Popularea bazei de date
  - Definirea relațiilor
  - Operații DDL și DML avansate
  - Interogări de tip SELECT complexe

- `BD_PROIECT_SerbanSilviu1065.pdf`: documentația completă a proiectului, inclusiv modelul relațional, explicații detaliate și exemple de interogări.

## 🛠️ Cerințe

- Oracle SQL / orice sistem de baze de date compatibil SQL
- SQL Developer / DBeaver / alt client pentru execuția scripturilor

## 🔍 Funcționalități Demonstrate

- Tranzacții clasificate pe intervale orare
- Vederi (views) pentru analiză și raportare
- Utilizarea secvențelor pentru auto-generare ID-uri
- Clasificarea clienților și tranzacțiilor
- Ierarhii organizaționale ale angajaților
