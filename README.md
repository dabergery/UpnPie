
<body>
    <div class="container">
        <h2>Introduction</h2>
        <ul class="tools-list">
            <a href="https://github.com/dabergery/dabergery/blob/main/images/image.png" alt="UPnP Image schema">
                <img src="https://github.com/dabergery/dabergery/blob/main/images/image.png">
            </a>
            <a href="https://www.shodan.io/search?query=ssdp" alt="UPnP Image schema" width="250" height="60">
                <img src="https://www.shodan.io/static/img/logo-6abcc86b.png">
            </a>
            <a href="https://dnschecker.org/port-scanner.php" alt="UPnP Image schema" width="250" height="60">
                <img src="https://dnschecker.org/themes/common/images/general/logo.svg">
            </a>
            <li><a href="https://www.shodan.io/search?query=ssdp" target="_blank">UPNP Router on Shodan.io</a></li>
            <li><a href="https://dnschecker.org/port-scanner.php" target="_blank">Custom Port scanner</a></li>
            <li>Port by Default of UPnP 1900</li>
            <li>SSDP Port 10-24-65535 ( You can find on Shodan )</li>
            <li>Inside the victim network interesting ports 22, 23, 53, 80, 443, 445, 135</li>
        </ul>
        <br>
        <img src="https://github.com/dabergery/dabergery/blob/main/SSDP_Lookup.png?raw=true" alt="Recherche SSDP" width="800" height="500">
        <h2>Installing the UPnP Tool on a Linux System</h2>
        <div class="code-block">
    <pre>
    <code>
    sudo apt update -y && sudo apt upgrade -y
    sudo apt-get install netcat-traditional
    git clone https://github.com/dabergery/UpnPie.git
    cd UpnPie
    sudo chmod 0755 *
    ./00_nc_scan.sh
    </code>
    </pre>
        </div>
    </div>
</body>
</html>
