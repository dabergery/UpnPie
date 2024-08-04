
<body>
    <div class="container">
        <h2>Outils Utilisés</h2>
        <ul class="tools-list">
            <li><a href="https://www.shodan.io/search?query=port%3A1900+upnp" target="_blank">Recherche UPnP sur Shodan</a></li>
            <li><a href="https://dnschecker.org/port-scanner.php" target="_blank">Scanner de Ports DNS Checker</a></li>
            <li>Port UPnP du service Universal Plug and Play = 1900.</li>
            <li>Port de scan Simple Service Discovery Protocol (SSDP) = port TCP aléatoire entre 1024-65535 à trouver dans Shodan !</li>
            <li>Ports internes d'attaque: 22, 23, 53, 80, 443, 445, 135, 1900, 5000</li>
        </ul>
        <br>
        <img src="https://github.com/dabergery/dabergery/blob/main/SSDP_Lookup.png?raw=true" alt="Recherche SSDP" width="800" height="500">
        <h2>Installation de l'outil UPnP sur un système Linux</h2>
        <div class="code-block">
            <pre><code>sudo apt update -y && sudo apt upgrade -y
sudo apt install python3
git clone https://github.com/dabergery/UpnPie.git
cd UpnPie
sudo chmod 777 *
bash 01_curl_router.sh
            </code></pre>
        </div>
    </div>
</body>
</html>
