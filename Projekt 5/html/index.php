<?php
$servername = "database";
$username = "admin";
$password = "heslo";
$database = "univerzita";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$xml = new SimpleXMLElement('<?xml-stylesheet type="text/xsl" href="xml/fakulta.xsl"?><fakulty/>');

# Fakulty
$resultFakulty = $conn->query(
    "SELECT F.id_fakulty, F.nazev, Z.id_zamestnance, Z.jmeno, Z.prijmeni, Z.telefon, Z.email 
    FROM Fakulty F
    JOIN Zamestnanci Z ON F.id_dekan = Z.id_zamestnance"
);
if ($resultFakulty->num_rows > 0) {

    while ($rowFakulta = $resultFakulty->fetch_assoc()) {
        $fakulta = $xml->addChild("fakulta");
        $fakulta->addChild("nazev", $rowFakulta["nazev"]);
        # Dekan
        $dekan = $fakulta->addChild("dekan");
        $dekan->addChild("jmeno", $rowFakulta["jmeno"]);
        $dekan->addChild("prijmeni", $rowFakulta["prijmeni"]);
        $dekan->addChild("telefon", $rowFakulta["telefon"]);
        $dekan->addChild("email", $rowFakulta["email"]);
        $resultTituly = $conn->query(
            "SELECT T.nazev_titulu, T.zkratka 
                            FROM ZamestnanecTituly ZT 
                            JOIN Tituly T ON ZT.id_titulu = T.id_titulu 
                            WHERE ZT.id_zamestnance = {$rowFakulta['id_zamestnance']}"
        );
        if ($resultTituly->num_rows > 0) {
            $Tituly = $dekan->addChild("tituly");
            while ($rowTitul = $resultTituly->fetch_assoc()) {
                $Tituly->addChild("titul", "{$rowTitul['nazev_titulu']} ({$rowTitul['zkratka']})");
            }
        }
        # Katedry
        $resultKatedry = $conn->query(
            "SELECT K.id_katedry, K.nazev_katedry, Z.id_zamestnance, Z.jmeno, Z.prijmeni, Z.telefon, Z.email 
            FROM Katedry K
            JOIN Zamestnanci Z ON K.id_vedouci = Z.id_zamestnance
            WHERE K.id_fakulty = {$rowFakulta["id_fakulty"]}"
        );
        if ($resultKatedry->num_rows > 0) {
            $katedry = $fakulta->addChild("katedry");
            while ($rowKatedra = $resultKatedry->fetch_assoc()) {
                # Katedra
                $katedra = $katedry->addChild("katedra");
                $katedra->addChild("nazev", $rowKatedra["nazev_katedry"]);
                # Vedouci
                $vedouci = $katedra->addChild("vedouci");
                $vedouci->addChild("jmeno", $rowKatedra["jmeno"]);
                $vedouci->addChild("prijmeni", $rowKatedra["prijmeni"]);
                $vedouci->addChild("telefon", $rowKatedra["telefon"]);
                $vedouci->addChild("email", $rowKatedra["email"]);
                $resultTituly = $conn->query(
                    "SELECT T.nazev_titulu, T.zkratka
                            FROM ZamestnanecTituly ZT 
                            JOIN Tituly T ON ZT.id_titulu = T.id_titulu 
                            WHERE ZT.id_zamestnance = {$rowKatedra['id_zamestnance']}"
                );
                if ($resultTituly->num_rows > 0) {
                    $Tituly = $vedouci->addChild("tituly");
                    while ($rowTitul = $resultTituly->fetch_assoc()) {
                        $Tituly->addChild("titul", "{$rowTitul['nazev_titulu']} ({$rowTitul['zkratka']})");
                    }
                }
                # Zamestnanci
                $resultZamestnanci = $conn->query(
                    "SELECT Z.*, P.nazev_pozice
                     FROM Zamestnanci Z
                     LEFT JOIN Pozice P ON Z.id_pozice = P.id_pozice
                     WHERE Z.id_katedry = {$rowKatedra["id_katedry"]}"
                );
                if ($resultZamestnanci->num_rows > 0) {
                    $zamestnanci = $katedra->addChild("zamestnanci");
                    while ($rowZamestnanec = $resultZamestnanci->fetch_assoc()) {
                        # Zamestnanec
                        $zamestnanec = $zamestnanci->addChild("zamestnanec");
                        $zamestnanec->addChild("jmeno", $rowZamestnanec["jmeno"]);
                        $zamestnanec->addChild("prijmeni", $rowZamestnanec["prijmeni"]);
                        $zamestnanec->addChild("telefon", $rowZamestnanec["telefon"]);
                        $zamestnanec->addChild("email", $rowZamestnanec["email"]);
                        $zamestnanec->addChild("pozice", $rowZamestnanec["nazev_pozice"]);
                        $resultTituly = $conn->query(
                            "SELECT T.nazev_titulu, T.zkratka 
                            FROM ZamestnanecTituly ZT 
                            JOIN Tituly T ON ZT.id_titulu = T.id_titulu 
                            WHERE ZT.id_zamestnance = {$rowZamestnanec['id_zamestnance']}"
                        );
                        if ($resultTituly->num_rows > 0) {
                            $Tituly = $zamestnanec->addChild("tituly");
                            while ($rowTitul = $resultTituly->fetch_assoc()) {
                                $Tituly->addChild("titul", "{$rowTitul['nazev_titulu']} ({$rowTitul['zkratka']})");
                            }
                        }
                    }
                }
                # Predmety
                $resultPredmety = $conn->query("
                    SELECT P.*
                    FROM Predmety P
                    WHERE P.id_katedry = {$rowKatedra["id_katedry"]}");

                if ($resultPredmety->num_rows > 0) {
                    $predmety = $katedra->addChild("predmety");
                    while ($rowPredmet = $resultPredmety->fetch_assoc()) {
                        # Zamestnanec
                        $predmet = $predmety->addChild("predmet");
                        $predmet->addChild("nazev", $rowPredmet["nazev_predmetu"]);
                        $predmet->addChild("popis", $rowPredmet["popis_predmetu"]);
                        $predmet->addAttribute("zkratka", $rowPredmet["zkratka_predmetu"]);
                    }
                }
            }
        }
    }
}
header('Content-Type: application/xml');
echo $xml->asXML();


$conn->close();
