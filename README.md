# Certificate and Key Verification Script

This repository contains a Bash script that verifies whether a given SSL/TLS certificate and private key are related. It uses OpenSSL to compare the modulus of both the certificate and the key.

## Prerequisites

- Bash shell
- OpenSSL

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/aria3ppp/check-cert-key.git
   ```
2. Change to the repository directory:
   ```
   cd cert-key-check
   ```
3. Make the script executable:
   ```
   chmod +x check_cert_key.sh
   ```

## Usage

Run the script with two arguments: the path to the certificate file and the path to the key file.

```
./check_cert_key.sh /path/to/your_certificate.crt /path/to/your_private_key.key
```

Example:
```
./check_cert_key.sh /etc/ssl/certs/example.com.crt /etc/ssl/private/example.com.key
```

## How it works

The script performs the following steps:

1. Extracts the modulus from the certificate using `openssl x509`.
2. Extracts the modulus from the private key using `openssl rsa`.
3. Compares the two modulus values.
4. Outputs whether the certificate and key match or not.

## Error handling

The script includes basic error handling:

- It checks if both arguments (certificate and key file paths) are provided.
- It verifies that both files exist before attempting to process them.

## Contributing

Contributions to improve the script are welcome. Please feel free to submit a Pull Request.

## License

This project is open source and available under the [MIT License](LICENSE).

## Disclaimer

This script is provided as-is, without any warranty. Always ensure you're working with backups of your important SSL/TLS files.
