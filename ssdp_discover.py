import socket
import sys

def ssdp_discover(router_ip):
    # Définition des paramètres de la requête SSDP
    SSDP_ADDR = "239.255.255.250"
    SSDP_PORT = 1900
    SSDP_MX = 2  # Temps d'attente maximal pour la réponse en secondes
    SSDP_ST = "ssdp:all"  # Service Type pour rechercher tous les services

    # Création de la requête SSDP M-SEARCH
    ssdp_request = (
        "M-SEARCH * HTTP/1.1\r\n" +
        "HOST:{}:{}\r\n".format(SSDP_ADDR, SSDP_PORT) +
        'MAN: "ssdp:discover"\r\n' +
        "MX: {}\r\n".format(SSDP_MX) +
        "ST: {}\r\n".format(SSDP_ST) +
        "\r\n"
    )

    # Création du socket UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.settimeout(SSDP_MX)  # Temps d'attente pour la réponse

    try:
        # Envoi de la requête SSDP à l'IP du routeur spécifié
        sock.sendto(ssdp_request.encode(), (router_ip, SSDP_PORT))

        # Attente de la réponse
        while True:
            try:
                data, addr = sock.recvfrom(1024)
                print(f"Réponse reçue de {addr} :")
                print(data.decode())
            except socket.timeout:
                print("Délai d'attente écoulé. Aucune réponse supplémentaire.")
                break

    finally:
        # Fermeture du socket
        sock.close()

# Vérifier si l'adresse IP du routeur est fournie en argument
if len(sys.argv) != 2:
    print("Usage: python ssdp_discover.py <router_ip>")
    sys.exit(1)

router_ip = sys.argv[1]
ssdp_discover(router_ip)