<!DOCTYPE html>
<html>

<head>
    <style type="text/css">
        .nav-item {
            padding-right: 20px;
            float: left;
        }

        .nav {
            display: flex;
            clear: both;
        }
    </style>
</head>

<body>
    <div class="nav">
        <?php
        $files = glob('xml/*.xml');
        foreach ($files as $file) {
            $fileName = pathinfo($file, PATHINFO_FILENAME);
        ?>
            <div class="nav-item">
                <a href='?file=<?= $fileName ?>'>
                    <?= $fileName ?>
                </a>
            </div>
        <?php } ?>
    </div>
    <?php
    if (isset($_GET['file'])) {
        $filename = $_GET['file'];

        $xml = new DOMDocument;
        $xml->load("xml/$filename.xml");

        $xsl = new DOMDocument;
        $xsl->load("xml/$filename.xsl");

        $xslt = new XSLTProcessor();
        $xslt->importStylesheet($xsl);

        $transformedXML = $xslt->transformToXml($xml);
        echo $transformedXML;
    }
    ?>
</body>

</html>